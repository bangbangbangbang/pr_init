package com.fld.framework.exception;

import com.fld.framework.entity.BaseStatus;

/**
 * 用于事务回退异常
 * 
 * @author zhaokuner
 *
 */
public class TransactionalException extends ActionException {

	private static final long serialVersionUID = -7412474107927474728L;

	public TransactionalException() {
		super();
	}

	public TransactionalException(BaseStatus status) {
		super(status.getCode(), status.getMsg());
	}

	public TransactionalException(String message, Throwable cause) {
		super(message, cause);
	}

	public TransactionalException(String message) {
		super(message);
	}

	public TransactionalException(Throwable cause) {
		super(cause);
	}

	public static void throwException(BaseStatus status) {
		throw new TransactionalException(status);
	}
}
