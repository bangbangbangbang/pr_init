package com.fld.framework.entity;

public class StringEntry<T> extends Entry<String, T> {
	private static final long serialVersionUID = 1L;

	public StringEntry() {
	}

	public StringEntry(String code, T msg) {
		this.code = code;
		this.msg = msg;
	}
}
