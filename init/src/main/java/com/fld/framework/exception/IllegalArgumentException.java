package com.fld.framework.exception;

public class IllegalArgumentException extends BusinessException {

	private static final long serialVersionUID = 6865838997477426086L;

	public IllegalArgumentException() {
		super();
	}

	public IllegalArgumentException(String message, Throwable cause) {
		super(message, cause);
	}

	public IllegalArgumentException(String message) {
		super(message);
	}

	public IllegalArgumentException(Throwable cause) {
		super(cause);
	}

}
