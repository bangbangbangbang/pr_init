package com.fld.framework.entity;

public class BiStringEntry extends Entry<String, String> {
	private static final long serialVersionUID = 1L;

	public BiStringEntry() {
	}

	public BiStringEntry(String code, String msg) {
		this.code = code;
		this.msg = msg;
	}

}
