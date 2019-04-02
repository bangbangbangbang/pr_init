package com.fld.framework.dto;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import com.fld.framework.util.JacksonUtils;

/**
 * 公有参数封装
 * 
 * @author zhaokuner
 * 
 */
public class Header implements Serializable {

	private static final long serialVersionUID = 8707714910967749999L;
	public static final String PARAMS_SERVICE_ID = "serviceId";
	public static final String PARAMS_SERVICE_VERSION = "serviceVersion";
	public static final String PARAMS_SERVICE_TYPE = "serviceType";
	public static final String PARAMS_STATE = "state";
	public static final String PARAMS_VERSION = "version";

	/** 业务线ID */
	private String serviceId;
	/** 业务线版本 */
	private String serviceVersion;
	/** 业务线类型 */
	private String serviceType;
	/** 回溯信息 */
	private String state;
	/** 服务版本号 */
	private String version;

	public Header() {
	}

	public Header(HttpServletRequest req) {
		init(req);
	}

	public void init(HttpServletRequest req) {
		if (null != req) {
			this.setServiceId(req.getParameter(PARAMS_SERVICE_ID));
			this.setServiceType(req.getParameter(PARAMS_SERVICE_TYPE));
			this.setServiceVersion(req.getParameter(PARAMS_SERVICE_VERSION));
			this.setState(req.getParameter(PARAMS_STATE));
			this.setVersion(req.getParameter(PARAMS_VERSION));
		}
	}

	public void copy(Header header) {
		this.setServiceId(header.getServiceId());
		this.setServiceType(header.getServiceType());
		this.setServiceVersion(header.getServiceVersion());
		this.setState(header.getState());
		this.setVersion(header.getVersion());
	}

	public String toJson() {
		String json = JacksonUtils.toJson(this);
		return json;
	}

	@Override
	public String toString() {
		return "Header [serviceId=" + serviceId + ", serviceVersion=" + serviceVersion + ", serviceType=" + serviceType + ", state=" + state + ", version=" + version + "]";
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
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

	/** web 服务类型 */
	public static final String TYPE_WEB = "0";

	/** sdk 服务类型 */
	public static final String TYPE_APP = "1";

	/** wap 服务类型 */
	public static final String TYPE_WAP = "2";

}
