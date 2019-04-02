package com.fld.framework.dto.api;

import java.io.Serializable;
import com.fld.framework.util.JacksonUtils;

/**
 * 返回数据 data基类
 * 
 * @author zhaokuner
 *
 */
public class ApiRespData implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1772501545160362738L;

	protected Serializable ext;

	public String toJson() {
		return JacksonUtils.toJson(this);
	}

	public Serializable getExt() {
		return ext;
	}

	public void setExt(Serializable ext) {
		this.ext = ext;
	}

}