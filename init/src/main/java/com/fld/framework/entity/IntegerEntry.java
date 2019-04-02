package com.fld.framework.entity;

public class IntegerEntry extends Entry<Integer, String> {
	private static final long serialVersionUID = 1L;

	public IntegerEntry() {

	}

	public IntegerEntry(Integer code, String msg) {
		this.code = code;
		this.msg = msg;
	}
}
