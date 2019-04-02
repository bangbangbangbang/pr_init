package com.fld.framework.exception;

public class BusinessException extends ActionException {

	private static final long serialVersionUID = -7412474107927474728L;

	public BusinessException() {
		super();
	}

	public BusinessException(String message, Throwable cause) {
		super(message, cause);
	}

	public BusinessException(String message) {
		super(message);
	}

	public BusinessException(Throwable cause) {
		super(cause);
	}

}
