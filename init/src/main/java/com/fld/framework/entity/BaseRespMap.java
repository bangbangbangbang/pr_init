package com.fld.framework.entity;

import java.util.HashMap;
import com.fld.framework.constant.RespStatus;

/**
 * 返回数据MAP
 * 
 * @author zhaokuner
 * 
 */
public class BaseRespMap extends HashMap<String, Object> {

	private static final long serialVersionUID = -1902796915089520385L;

	public static final String CODE = "code";
	public static final String MSG = "msg";
	public static final String SUCCESS = "success";

	public BaseRespMap() {
		this.success();
	}

	public BaseRespMap putStatusEnum(BaseStatus baseStatus) {
		this.put(CODE, baseStatus.getCode());
		this.put(MSG, baseStatus.getMsg());
		isSuccess();
		return this;
	}

	public int getCode() {
		return (int) this.get(CODE);
	}

	public String getMsg() {
		return String.valueOf(this.get(MSG));
	}

	public BaseRespMap success() {
		this.setCode(RespStatus.SUCCESS.getCode());
		this.setMsg(RespStatus.SUCCESS.getMsg());
		this.setSuccess(true);
		return this;
	}

	public BaseRespMap success(String msg) {
		this.setCode(RespStatus.SUCCESS.getCode());
		this.setMsg(msg);
		this.setSuccess(true);
		return this;
	}

	public BaseRespMap error() {
		this.setCode(RespStatus.REQ_ERROR.getCode());
		this.setMsg(RespStatus.REQ_ERROR.getMsg());
		this.setSuccess(false);
		return this;
	}

	public BaseRespMap error(String msg) {
		this.setCode(RespStatus.REQ_ERROR.getCode());
		this.setMsg(msg);
		this.setSuccess(false);
		return this;
	}

	public boolean isSuccess() {
		boolean bool = this.getCode() == RespStatus.SUCCESS.getCode();
		this.put(SUCCESS, bool);
		return bool;
	}

	public Boolean getSuccess() {
		return (Boolean) this.get(SUCCESS);
	}

	public void setSuccess(Boolean success) {
		this.put(SUCCESS, success);
	}

	public void setCode(int code) {
		this.put(CODE, code);
		isSuccess();
	}

	public void setMsg(String msg) {
		this.put(MSG, msg);
	}

}
