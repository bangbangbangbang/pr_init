package com.fld.framework.entity;

import java.io.Serializable;
import com.fld.framework.constant.RespStatus;

/**
 * 返回数据基类
 * 
 * @author zhaokuner
 * 
 */
public class BaseRespBean<T> extends BaseResp implements Serializable {

	private static final long serialVersionUID = 1L;

	T bean;

	public BaseRespBean() {

	}

	public static <T> BaseRespBean<T> newBeanBaseResp(BaseResp baseResp) {
		BaseRespBean<T> bean = new BaseRespBean<T>();
		bean.setCode(baseResp.getCode());
		bean.setMsg(baseResp.getMsg());
		bean.setExt(baseResp.getExt());
		return bean;
	}

	public static <T> BaseRespBean<T> newBeanInstance(BaseStatus baseStatus) {
		return new BaseRespBean<T>().putStatus(baseStatus);
	}

	public static <T> BaseRespBean<T> newBeanSuccess(T bean) {
		BaseRespBean<T> brb = new BaseRespBean<T>().success();
		brb.setBean(bean);
		return brb;
	}

	public static <T> BaseRespBean<T> newBeanError() {
		return new BaseRespBean<T>().error();
	}

	public BaseRespBean<T> putStatus(BaseStatus baseStatus) {
		this.code = baseStatus.getCode();
		this.msg = baseStatus.getMsg();
		return this;
	}

	public BaseRespBean<T> success() {
		this.code = RespStatus.SUCCESS.getCode();
		this.msg = RespStatus.SUCCESS.getMsg();
		return this;
	}

	public BaseRespBean<T> error() {
		this.code = RespStatus.ERROR.getCode();
		this.msg = RespStatus.ERROR.getMsg();
		return this;
	}

	public BaseRespBean<T> msg(String msg) {
		this.setMsg(msg);
		return this;
	}

	public BaseRespBean<T> ext(Serializable ext) {
		this.setExt(ext);
		return this;
	}

	public BaseRespBean<T> bean(T bean) {
		this.setBean(bean);
		return this;
	}

	@Override
	public String toString() {
		return toJson();
	}

	public T getBean() {
		return bean;
	}

	public void setBean(T bean) {
		this.bean = bean;
	}
}
