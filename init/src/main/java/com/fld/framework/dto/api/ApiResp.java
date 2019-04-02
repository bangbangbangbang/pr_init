package com.fld.framework.dto.api;

import java.io.Serializable;
import java.util.List;
import com.fld.framework.constant.RespStatus;
import com.fld.framework.entity.BaseList;
import com.fld.framework.entity.BaseResp;
import com.fld.framework.entity.BaseStatus;

/**
 * 返回数据基类
 * 
 * @author zhaokuner
 *
 */
public class ApiResp extends BaseResp {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3515924068002172779L;

	/** 是否加密 */
	protected Boolean encrypt;
	/** 回溯信息 */
	protected String state;
	/** 时间戳（毫秒 */
	protected Long timestamp = System.currentTimeMillis();
	/** 业务数据 */
	protected Object data;

	public BaseResp putStatus(BaseStatus baseStatus) {
		this.code = baseStatus.getCode();
		this.msg = baseStatus.getMsg();
		return this;
	}

	public static ApiResp newError() {
		ApiResp ar = new ApiResp();
		ar.putStatus(RespStatus.ERROR);
		return ar;
	}

	public static ApiResp newError(BaseStatus baseStatus) {
		ApiResp ar = new ApiResp();
		ar.putStatus(baseStatus);
		return ar;
	}

	public static ApiResp newSuccess() {
		ApiResp ar = new ApiResp();
		ar.putStatus(RespStatus.SUCCESS);
		return ar;
	}

	public static ApiResp newSuccess(ApiRespData data) {
		ApiResp ar = newSuccess();
		ar.setData(data);
		return ar;
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
		return this.data;
	}

	public ApiResp setData(Object data) {
		this.data = data;
		return this;
	}

	/**
	 * 不带分页，仅是list数据的转换
	 */
	public <T extends Serializable> ApiResp setList(List<T> list) {
		if (null != list) {
			ApiRespListData<T> result = new ApiRespListData<T>();
			result.setTotalPage(1);
			result.setTotalRows(list.size());
			result.setList(list);
			this.data = result;
		}

		return this;
	}

	/**
	 * 带分页信息
	 * 
	 * @param list
	 */
	public <T extends Serializable> ApiResp setBaseList(BaseList<T> list) {
		if (list.isSuccess()) {
			ApiRespListData<T> result = new ApiRespListData<T>();
			result.setTotalPage(list.getTotalPage());
			result.setTotalRows(list.getTotalRows());
			result.setList(list.getList());
			result.setExt(list.getExt());
			this.data = result;
		} else {
			this.setCode(list.getCode());
			this.setMsg(list.getMsg());
		}

		return this;
	}
}
