package com.fld.framework.dto.api;

import java.io.Serializable;
import com.fld.framework.entity.BaseReq;
import com.fld.framework.util.JacksonUtils;

/**
 * 请求封装父类
 * 
 * @author zhaokuner
 * 
 */
public class ApiReq extends BaseReq implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 747501983476874249L;

	protected ApiReqContent apiReqContent = new ApiReqContent();

	/** 时间戳（毫秒） */
	protected Long timestamp = System.currentTimeMillis();

	public Long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}

	public ApiReqContent getApiReqContent() {
		return apiReqContent;
	}

	public void setApiReqContent(ApiReqContent apiReqContent) {
		this.apiReqContent = apiReqContent;
	}

	public String toJson() {
		return JacksonUtils.toJson(this);
	}

	@Override
	public String toString() {
		return toJson();
	}

}
