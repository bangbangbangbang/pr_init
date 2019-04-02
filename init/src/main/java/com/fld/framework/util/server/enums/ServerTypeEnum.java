package com.fld.framework.util.server.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * @Title: ServerTypeEnum.java
 * @Package com.fld.framework.util.server.enums
 * @author Tandy
 * @Company www.zhaokuner.com
 * @date 2015年8月5日 上午10:59:20
 * @version V1.0
 */
public enum ServerTypeEnum implements SuperEnum {
	/**
	 * Jetty6 0
	 */
	JETTY6(0, "Jetty6容器"),
	/**
	 * TOMCAT 1
	 */
	TOMCAT(1, "TOMCAT容器");

	/**
	 * @param code
	 * @param description
	 */
	private ServerTypeEnum(int code, String description) {
		this.code = code;
		this.description = description;
		EnumUtils.put(this.getClass().getName() + code, this);
	}

	public static boolean isEnum(int code) {
		ServerTypeEnum[] values = ServerTypeEnum.values();
		for (ServerTypeEnum e : values) {
			if (e.getCode() == code) {
				return true;
			}
		}
		return false;
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
	public static ServerTypeEnum valueOf(int code) {
		Object obj = EnumUtils.get(ServerTypeEnum.class.getName() + code);
		if (null != obj) {
			return (ServerTypeEnum) obj;
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
