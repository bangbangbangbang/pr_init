package com.fld.init.framework.runtime;

import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.fld.framework.dto.Device;
import com.fld.framework.dto.Header;
import com.fld.framework.dto.Proxy;

/**
 * 
 * @Title FullPathHolder.java
 * @Copyright 2015 (c)
 * @Description: 所有路径共有信息 <br>
 * @Company: zhaokuner.com
 * @Created on 2015年7月8日 下午1:47:57
 * @author zhaokuner
 * @version 1.0
 */
public class FullPathHolder {

	private static ThreadLocal<ConcurrentHashMap<String, Object>> threadLocal = new ThreadLocal<ConcurrentHashMap<String, Object>>() {
		@Override
		protected ConcurrentHashMap<String, Object> initialValue() {
			// 线程独享对象使用ConcurentHashMap似乎没有必要
			return new ConcurrentHashMap<String, Object>();
		}
	};

	public static String toThreadLocalString() {
		return threadLocal.get().toString();
	}

	public static final String REQUEST_SERVICEID_NAME = UrlHeaderExt.PARAMS_SERVICE_ID;
	public static final String REQUEST_SERVICE_VERSION_NAME = UrlHeaderExt.PARAMS_SERVICE_VERSION;
	public static final String REQUEST_SERVICE_TYPE_NAME = UrlHeaderExt.PARAMS_SERVICE_TYPE;

	public static final String REQUEST_DEVICE = "device";

	public static final String REQUEST_URLHEADER = "urlHeader";

	public static final String REQUEST_PROXY = "proxy";

	public static final String HTTP_REQUEST = "httpRequest";

	/** 便于统计请求时间 */
	public static final String REQUEST_TIME = "requestTime";

	public static final String REQUEST_ID = "requestId";

	public static final String HTTP_SERVLET_REQUEST = "HttpServletRequest";

	public static final String HTTP_SERVLET_RESPONSE = "HttpServletResponse";

	public static final String IS_WEIXIN = "isWeixin";

	public static UrlHeaderExt getHeader() {
		UrlHeaderExt header = getObj(REQUEST_URLHEADER);
		if (null == header) {
			header = new UrlHeaderExt();
		}
		return header;
	}

	public static void setHeader(UrlHeaderExt urlHeader) {
		put(REQUEST_URLHEADER, urlHeader);
	}

	public static void setHeader(Header header) {
		put(REQUEST_URLHEADER, new UrlHeaderExt(header));
	}

	public static void setProxy(Proxy proxy) {
		put(REQUEST_PROXY, proxy);
	}

	public static Proxy getProxy() {
		Proxy p = getObj(REQUEST_PROXY);
		if (null == p) {
			p = new Proxy();
		}
		return p;
	}

	public static void setHttpServletRequest(HttpServletRequest request) {
		put(HTTP_SERVLET_REQUEST, request);
	}

	public static HttpServletRequest getHttpServletRequest() {
		return getObj(HTTP_SERVLET_REQUEST);
	}

	public static void setHttpServletResponse(HttpServletResponse response) {
		put(HTTP_SERVLET_RESPONSE, response);
	}

	public static HttpServletResponse getHttpServletResponse() {
		return getObj(HTTP_SERVLET_RESPONSE);
	}

	public static Device getDevice() {
		Device d = getObj(REQUEST_DEVICE);
		if (null == d) {
			d = new Device();
		}
		return d;
	}

	public static void setDevice(Device device) {
		put(REQUEST_DEVICE, device);
	}

	public static Boolean isHttpRequest() {
		return Boolean.TRUE.equals(getObj(HTTP_REQUEST));
	}

	public static void setHttpRequest(Boolean httpRequest) {
		put(HTTP_REQUEST, httpRequest);
	}

	public static String getRequestTime() {
		return get(REQUEST_TIME);

	}

	public static void setRequestTime(String requestTime) {
		put(REQUEST_TIME, requestTime);
	}

	public static String getRequestId() {
		return get(REQUEST_ID);
	}

	public static void setRequestId(String requestId) {
		put(REQUEST_ID, requestId);
	}

	public static void cleanLocal() {
		threadLocal.remove();
	}

	private static void put(String key, Object value) {
		if (key != null && value != null) {
			threadLocal.get().put(key, value);
		}
	}

	@SuppressWarnings("unchecked")
	public static <T> T getObj(String key) {
		if (key == null)
			return null;
		Object obj = threadLocal.get().get(key);
		if (obj != null) {
			return (T) obj;
		}
		return null;
	}

	public static String get(String key) {
		if (key == null)
			return null;
		Object obj = threadLocal.get().get(key);
		if (obj != null) {
			return String.valueOf(obj);
		}
		return null;
	}
}
