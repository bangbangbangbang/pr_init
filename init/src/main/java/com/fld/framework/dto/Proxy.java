package com.fld.framework.dto;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import com.fld.framework.util.JacksonUtils;

/**
 * 代理应用
 * 
 * @author zhaokuner
 * 
 */
public class Proxy implements Serializable {

	private static final long serialVersionUID = 6865518728727644448L;

	public static final String PARAMS_PROXY = "proxy";

	/** 业务线ID */
	private String serviceId;
	/** 业务线版本 */
	private String serviceVersion;
	/** 业务线类型 */
	private String serviceType;

	public Proxy() {

	}

	public Proxy(HttpServletRequest req) {
		init(req);
	}

	public static Proxy init(HttpServletRequest req) {

		Proxy result = null;

		if (req != null) {
			String device = req.getParameter(PARAMS_PROXY);
			result = init(device);
		}

		return result;
	}

	public static Proxy init(String proxy) {

		Proxy result = null;

		if (StringUtils.isNotBlank(proxy)) {
			result = JacksonUtils.readValue(proxy, Proxy.class);
		}

		return result;
	}

	public String toJson() {
		String json = JacksonUtils.toJson(this);
		return json;
	}

	public String getServiceId() {
		return serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getServiceVersion() {
		return serviceVersion;
	}

	public void setServiceVersion(String serviceVersion) {
		this.serviceVersion = serviceVersion;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	@Override
	public String toString() {
		return "Proxy [serviceId=" + serviceId + ", serviceVersion=" + serviceVersion + ", serviceType=" + serviceType + "]";
	}

}
