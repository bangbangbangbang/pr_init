package com.fld.framework.entity;

public class LongEntry extends Entry<Long, String> {

	private static final long serialVersionUID = 1L;

	public LongEntry() {

	}

	public LongEntry(Long code, String msg) {
		this.code = code;
		this.msg = msg;
	}
}
