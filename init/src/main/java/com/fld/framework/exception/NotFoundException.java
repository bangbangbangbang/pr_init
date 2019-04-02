package com.fld.framework.exception;

public class NotFoundException extends ActionException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2990368752702298291L;

	public NotFoundException() {
		super();
	}

	public NotFoundException(int code, String msg) {
		super(code, msg);
	}

	public NotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public NotFoundException(String message) {
		super(message);
	}

	public NotFoundException(Throwable cause) {
		super(cause);
	}

}
