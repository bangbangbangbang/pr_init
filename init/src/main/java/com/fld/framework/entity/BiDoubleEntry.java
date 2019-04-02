package com.fld.framework.entity;

public class BiDoubleEntry extends Entry<Double, Double> {
	private static final long serialVersionUID = 1L;

	public BiDoubleEntry() {
	}

	public BiDoubleEntry(Double code, Double msg) {
		this.code = code;
		this.msg = msg;
	}
}
