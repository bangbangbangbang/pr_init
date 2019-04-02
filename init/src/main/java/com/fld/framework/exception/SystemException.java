package com.fld.framework.exception;

import com.fld.framework.constant.RespStatus;
import com.fld.framework.entity.BaseStatus;

public class SystemException extends ActionException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3402316066131362480L;

	public SystemException() {
		this.exceptionResp.putStatus(RespStatus.SYS_ERROR);
	}

	public SystemException(BaseStatus status) {
		super(status.getCode(), status.getMsg());
	}

	public SystemException(int code, String msg) {
		super(code, msg);
	}

	public SystemException(String message) {
		super(message);
	}

	public SystemException(Throwable cause) {
		super(cause);
	}

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}

}
