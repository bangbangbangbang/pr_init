package com.fld.framework.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * FAILURE 0 SUCCESS 1
 * 
 * @author zhaokuner
 *
 */
public enum SuccessOrFailureEnum implements SuperEnum {
	/**
	 * 1 SUCCESS
	 */
	SUCCESS(1, "SUCCESS"),
	/**
	 * 0 Failure
	 */
	FAILURE(0, "FAILURE");

	/**
	 * 构造函数
	 * 
	 * @param code
	 *            编码
	 * @param description
	 *            说明
	 */
	private SuccessOrFailureEnum(int code, String description) {
		this.code = code;
		this.description = description;
		EnumUtils.put(this.getClass().getName() + code, this);
	}

	/**
	 * <pre>
	 * 一个便利的方法，方便使用者通过code获得枚举对象，
	 * 对于非法状态，以个人处理&lt;/b&gt;
	 * </pre>
	 * 
	 * @param code
	 * @return
	 */
	public static SuccessOrFailureEnum codeOf(Integer code) {
		if (code != null) {
			Object obj = EnumUtils.get(SuccessOrFailureEnum.class.getName() + code);
			if (null != obj) {
				return (SuccessOrFailureEnum) obj;
			}
		}
		return null;
	}

	/** 编码 */
	private int code;

	/** 描述的KEY */
	private String description;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
