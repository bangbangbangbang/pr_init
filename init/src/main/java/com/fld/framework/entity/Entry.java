package com.fld.framework.entity;

import java.io.Serializable;
import com.fld.framework.util.JacksonUtils;

public class Entry<C, M> implements Serializable {

	private static final long serialVersionUID = -5388249502759048744L;

	public static final String SUCCESS = "200";
	public static final String ERROR = "400";
	public C code;
	public M msg;
	public Object ext;

	public Entry() {
	}

	public Entry(C code, M msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public Entry<C, M> put(C code, M msg) {
		this.code = code;
		this.msg = msg;
		return this;
	}

	public boolean isSuccess() {
		String code = String.valueOf(this.code);
		return SUCCESS.equals(code) || Boolean.TRUE.toString().equals(code) || "SUCCESS".equalsIgnoreCase(code);
	}

	public C getCode() {
		return code;
	}

	public void setCode(C code) {
		this.code = code;
	}

	public M getMsg() {
		return msg;
	}

	public void setMsg(M msg) {
		this.msg = msg;
	}

	public Object getExt() {
		return ext;
	}

	public void setExt(Object ext) {
		this.ext = ext;
	}

	@Deprecated
	public void setSuccess(boolean success) {

	}

	@Override
	public String toString() {
		return JacksonUtils.toJson(this);
	}

}
