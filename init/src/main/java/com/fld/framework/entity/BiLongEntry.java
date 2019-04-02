package com.fld.framework.entity;

public class BiLongEntry extends Entry<Long, Long> {

	private static final long serialVersionUID = 1L;

	public BiLongEntry() {

	}

	public BiLongEntry(Long code, Long msg) {
		this.code = code;
		this.msg = msg;
	}

}
