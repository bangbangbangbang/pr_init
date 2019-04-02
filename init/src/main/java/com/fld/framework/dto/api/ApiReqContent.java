package com.fld.framework.dto.api;

import java.io.Serializable;
import com.fld.framework.dto.Device;
import com.fld.framework.dto.Header;
import com.fld.framework.dto.Proxy;
import com.fld.framework.util.JacksonUtils;

/**
 * api请求内容
 * 
 * @author zhaokuner
 * 
 */
public class ApiReqContent implements Serializable {

	private static final long serialVersionUID = -7274446227878378647L;

	private Header header;
	private Device device;
	private Proxy proxy;

	public Header getHeader() {
		return header;
	}

	public void setHeader(Header header) {
		this.header = header;
	}

	public Device getDevice() {
		return device;
	}

	public void setDevice(Device device) {
		this.device = device;
	}

	public Proxy getProxy() {
		return proxy;
	}

	public void setProxy(Proxy proxy) {
		this.proxy = proxy;
	}

	public String toJson() {
		return JacksonUtils.toJson(this);
	}

	@Override
	public String toString() {
		return toJson();
	}
}
