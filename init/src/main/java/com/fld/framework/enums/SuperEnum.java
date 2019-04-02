package com.fld.framework.enums;

public interface SuperEnum {
	public int getCode();

	public void setCode(int code);

	public String getDescription();

	public void setDescription(String description);

	public static Integer getCode(SuperEnum sse) {
		return null == sse ? null : sse.getCode();
	}

	public default boolean is(Integer i) {
		return null == i ? false : getCode() == i.intValue();
	}

	public default boolean is(String i) {
		Integer ii = null;
		if (null != i && !"".equals(i)) {
			try {
				ii = Integer.valueOf(i);
			} catch (Exception e) {
				return false;
			}
		}
		return null == ii ? false : getCode() == ii.intValue();
	}
}
