package com.fld.framework.dto.api;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fld.framework.constant.RespStatus;
import com.fld.framework.entity.BaseResp;
import com.fld.framework.entity.BaseStatus;
import com.fld.framework.util.JacksonUtils;

/**
 * 接收到的返回数据
 * 
 * @author zhaokuner
 * 
 */
public class ApiResolveResp extends BaseResp {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7084456799376450043L;

	/** 是否加密 */
	protected Boolean encrypt = false;
	/** 回溯信息 */
	protected String state;
	/** 时间戳（毫秒 */
	protected Long timestamp;
	/** 业务数据 */
	protected Object data = new String();

	@JsonIgnore
	protected String original;

	@JsonIgnore
	private String sercertKey;

	public static ApiResolveResp parse(String json) {
		if (null != json && !json.isEmpty()) {
			return JacksonUtils.readValue(json, ApiResolveResp.class);
		}
		return null;
	}

	public <T> T paraseData(Class<T> clazz) {
		return JacksonUtils.readValue(data.toString(), clazz);
	}

	public <T> List<T> paraseDataList(Class<T> clazz) {
		return JacksonUtils.readListValue(data.toString(), clazz);
	}

	@SuppressWarnings("unchecked")
	public <T> LinkedHashMap<String, T> paraseDataMap(Class<T> clazz) {
		return JacksonUtils.readMapValue(data.toString(), LinkedHashMap.class, clazz);
	}

	public static ApiResolveResp newInstance(ApiRespData data) {
		ApiResolveResp a = new ApiResolveResp();
		a.putStatus(RespStatus.SUCCESS);
		a.setData(data);
		return a;
	}

	public static ApiResolveResp newInstance(ApiRespListData<Serializable> data) {
		ApiResolveResp a = new ApiResolveResp();
		a.putStatus(RespStatus.SUCCESS);
		a.setData(data);
		return a;
	}

	public ApiResolveResp putStatusEnum(BaseStatus baseStatus) {
		this.code = baseStatus.getCode();
		this.msg = baseStatus.getMsg();
		return this;
	}

	public String toJson() {
		return JacksonUtils.toJson(this);
	}

	public Boolean getEncrypt() {
		return encrypt;
	}

	public void setEncrypt(Boolean encrypt) {
		this.encrypt = encrypt;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Long timestamp) {
		this.timestamp = timestamp;
	}

	public Object getData() {
		return data;
	}

	public ApiResolveResp setData(Object data) {
		this.data = data;
		return this;
	}

	public String getSercertKey() {
		return sercertKey;
	}

	public void setSercertKey(String sercertKey) {
		this.sercertKey = sercertKey;
	}

	public String getOriginal() {
		return original;
	}

	public void setOriginal(String original) {
		this.original = original;
	}
}
