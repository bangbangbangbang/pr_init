package com.fld.framework.util.server.bean;

import java.io.Serializable;

/**
 * @Title: ServerConfig.java
 * @Package com.fld.framework.util.server.bean
 * @author Tandy
 * @Company www.zhaokuner.com
 * @date 2015年8月5日 上午9:18:41
 * @version V1.0
 */
public class ServerConfig implements Serializable {

	private static final long serialVersionUID = -254915751159096992L;

	private String serviceIp;

	private Integer servicePort;

	public String getServiceIp() {
		return serviceIp;
	}

	public void setServiceIp(String serviceIp) {
		this.serviceIp = serviceIp;
	}

	public Integer getServicePort() {
		return servicePort;
	}

	public void setServicePort(Integer servicePort) {
		this.servicePort = servicePort;
	}

}
