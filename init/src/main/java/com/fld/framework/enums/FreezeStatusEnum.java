package com.fld.framework.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * 0 冻结 1 正常
 * 
 * @author zhaokuner
 *
 */
public enum FreezeStatusEnum implements SuperEnum {
	/**
	 * 正常
	 */
	ACTIVED(1, "正常"),
	/**
	 * 冻结
	 */
	FREEZED(0, "冻结");

	/**
	 * 构造函数
	 * 
	 * @param code
	 *            编码
	 * @param description
	 *            说明
	 */
	private FreezeStatusEnum(int code, String description) {
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
	public static FreezeStatusEnum codeOf(Integer code) {
		if (code != null) {
			Object obj = EnumUtils.get(FreezeStatusEnum.class.getName() + code);
			if (null != obj) {
				return (FreezeStatusEnum) obj;
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
