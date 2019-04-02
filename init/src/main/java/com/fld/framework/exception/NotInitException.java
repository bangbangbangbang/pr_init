package com.fld.framework.exception;

import com.fld.framework.constant.RespStatus;
import com.fld.framework.entity.BaseStatus;

public class NotInitException extends ActionException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3402316066131362480L;

	public NotInitException() {
		this.exceptionResp.putStatus(RespStatus.NOT_INIT_ERROR);
	}

	public NotInitException(BaseStatus status) {
		super(status.getCode(), status.getMsg());
	}

	public NotInitException(int code, String msg) {
		super(code, msg);
	}

	public NotInitException(String message) {
		super(message);
	}

	public NotInitException(Throwable cause) {
		super(cause);
	}

	public NotInitException(String message, Throwable cause) {
		super(message, cause);
	}

}
