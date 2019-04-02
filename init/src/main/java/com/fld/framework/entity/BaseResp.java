package com.fld.framework.entity;

import java.io.Serializable;
import com.fld.framework.constant.RespStatus;
import com.fld.framework.util.JacksonUtils;
import com.fld.framework.util.TransBeanMap;

/**
 * 返回数据基类
 * 
 * @author zhaokuner
 * 
 */
public class BaseResp extends TransBeanMap implements Serializable {

	private static final long serialVersionUID = 7661982863421965725L;

	/** 结果码 */
	protected Integer code;
	/** 结果说明 */
	protected String msg;
	/** 扩展数据 */
	protected Serializable ext;

	public BaseResp() {

	}

	public static BaseResp newInstance(BaseStatus baseStatus) {
		return new BaseResp().putStatus(baseStatus);
	}

	public static BaseResp newSuccess() {
		return new BaseResp().success();
	}

	public static BaseResp newError() {
		return new BaseResp().error();
	}

	public BaseResp putStatus(BaseStatus baseStatus) {
		this.code = baseStatus.getCode();
		this.msg = baseStatus.getMsg();
		return this;
	}

	public Integer getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	public BaseResp success() {
		this.code = RespStatus.SUCCESS.getCode();
		this.msg = RespStatus.SUCCESS.getMsg();
		return this;
	}

	public BaseResp error() {
		this.code = RespStatus.ERROR.getCode();
		this.msg = RespStatus.ERROR.getMsg();
		return this;
	}

	public boolean isSuccess() {
		return RespStatus.SUCCESS.getCode().equals(code);
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Serializable getExt() {
		return ext;
	}

	public void setExt(Serializable ext) {
		this.ext = ext;
	}

	public String toJson() {
		return JacksonUtils.toJson(this);
	}

	public BaseResp msg(String msg) {
		this.setMsg(msg);
		return this;
	}

	public BaseResp ext(Serializable ext) {
		this.setExt(ext);
		return this;
	}

	@Override
	public String toString() {
		return toJson();
	}
}
