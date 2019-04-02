package com.fld.framework.enums;

import java.util.Objects;

public interface SuperStrEnum {
	public String getCode();

	public void setCode(String code);

	public String getDescription();

	public void setDescription(String description);

	public static String getCode(SuperStrEnum sse) {
		return null == sse ? null : sse.getCode();
	}

	public default boolean is(String code) {
		return (null == code || "".equals(code)) ? false : Objects.equals(code, getCode());
	}
}
