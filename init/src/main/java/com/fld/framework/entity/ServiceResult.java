package com.fld.framework.entity;

import com.fld.framework.constant.RespStatus;
import com.fld.framework.util.JacksonUtils;

/**
 * 返回结果
 */
public class ServiceResult<B> extends BaseResp {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4824886552786473184L;

	/** 业务处理状态 */
	protected BaseStatus businessResult = null;

	/** 业务结果 */
	protected B businessObject = null;

	public ServiceResult() {

	}

	public ServiceResult(BaseStatus businessResult) {
		super();
		this.businessResult = businessResult;
		this.putStatus(businessResult);
	}

	public ServiceResult(B businessObject) {
		super();
		this.businessResult = RespStatus.SUCCESS;
		this.businessObject = businessObject;
		this.putStatus(businessResult);
	}

	public ServiceResult(BaseStatus businessResult, B businessObject) {
		super();
		this.businessResult = businessResult;
		this.businessObject = businessObject;
		this.putStatus(businessResult);
	}

	public ServiceResult<B> success(B businessObject) {
		this.businessResult = RespStatus.SUCCESS;
		this.businessObject = businessObject;
		this.putStatus(this.businessResult);
		return this;
	}

	public ServiceResult<B> error(BaseStatus businessResult) {
		return put(businessResult, null);
	}

	public ServiceResult<B> put(BaseStatus businessResult, B businessObject) {
		this.businessResult = businessResult;
		this.businessObject = businessObject;
		this.putStatus(businessResult);
		return this;
	}

	public BaseStatus getBusinessResult() {
		if (null == businessResult) {
			if (null != this.getCode()) {
				businessResult = new BaseStatus(this.getCode(), this.getMsg());
			}
		}
		return businessResult;
	}

	public void setBusinessResult(BaseStatus businessResult) {
		this.businessResult = businessResult;
		this.putStatus(businessResult);
	}

	public B getBusinessObject() {
		return businessObject;
	}

	public void setBusinessObject(B businessObject) {
		this.businessObject = businessObject;
	}

	@Override
	public String toString() {
		return "ServiceResult [businessResult=" + JacksonUtils.toJson(businessResult) + ", businessObject=" + (businessObject == null ? null : JacksonUtils.toJson(businessObject)) + ", code=" + code + ", msg=" + msg + ", ext=" + ext + ", success=" + isSuccess() + "]";
	}

}
