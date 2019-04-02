package com.fld.framework.dto;

import javax.servlet.http.HttpServletRequest;

/**
 * 页面跳转 参数对象
 * 
 * @author zhaokuner
 *
 */
public class UrlHeader extends Header {

	private static final long serialVersionUID = -851794158025288195L;

	public static final String PARAMS_REDIRECTURI = "redirectUri";

	private String redirectUri;

	public UrlHeader() {

	}

	public UrlHeader(UrlHeader urlHeader) {
		copy(urlHeader);
	}

	public void copy(UrlHeader urlHeader) {
		if (null == urlHeader) {
			return;
		}
		this.setRedirectUri(urlHeader.getRedirectUri());
		this.setServiceId(urlHeader.getServiceId());
		this.setServiceType(urlHeader.getServiceType());
		this.setServiceVersion(urlHeader.getServiceVersion());
		this.setState(urlHeader.getState());
		this.setVersion(urlHeader.getVersion());
	}

	public UrlHeader(HttpServletRequest req) {
		init(req);
	}

	public void init(HttpServletRequest req) {
		if (null != req) {
			super.init(req);
			this.setRedirectUri(req.getParameter(PARAMS_REDIRECTURI));
		}
	}

	public String getRedirectUri() {
		return redirectUri;
	}

	public void setRedirectUri(String redirectUri) {
		this.redirectUri = redirectUri;
	}

}
