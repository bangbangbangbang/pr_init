package com.fld.framework.entity;

public class DoubleEntry extends Entry<Double, String> {
	private static final long serialVersionUID = 1L;

	public DoubleEntry() {
	}

	public DoubleEntry(Double code, String msg) {
		this.code = code;
		this.msg = msg;
	}

}
