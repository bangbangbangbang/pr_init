package com.fld.framework.entity;

import java.io.Serializable;

/**
 * 业务返回状态
 * 
 * @author zhaokuner
 * 
 */
public class BaseStatus implements Serializable {

	/** 
	*/
	private static final long serialVersionUID = -8609778684284494504L;
	private final Integer code;
	private final String msg;

	public BaseStatus(Integer code, String msg) {
		super();
		this.code = code;
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("BaseStatus [code=");
		builder.append(code);
		builder.append(", msg=");
		builder.append(msg);
		builder.append("]");
		return builder.toString();
	}

}
