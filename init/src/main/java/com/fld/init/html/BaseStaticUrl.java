package com.fld.init.html;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class BaseStaticUrl extends BodyTagSupport {
	private static final long serialVersionUID = 1L;
	private String baseUrl;
	private String version;
	private boolean gain;
	private boolean init;

	public static final String BASE_STATIC_URL = "baseStaticUrl";
	public static final String VERSION = "version";
	public static final String VERSION_PARAM_NAME = "v";

	@Override
	public int doStartTag() throws JspException {
		if (null != this.getBaseUrl()) {
			this.pageContext.setAttribute(BASE_STATIC_URL, this.getBaseUrl());
		} else {
			this.setBaseUrl((String) this.pageContext.getAttribute(BASE_STATIC_URL));
		}
		if (null != this.getVersion()) {
			this.pageContext.setAttribute(VERSION, this.getVersion());
		} else {
			this.setVersion((String) this.pageContext.getAttribute(VERSION));
		}

		appendBaseUrl();

		return EVAL_BODY_INCLUDE;
	}

	private void appendBaseUrl() {
		if (!init && null != this.getBaseUrl()) {
			try {
				pageContext.getOut().write(this.getBaseUrl());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void appendVersion() {
		if (!init && !gain && null != this.getVersion()) {
			try {
				pageContext.getOut().write("?" + VERSION_PARAM_NAME + "=" + this.getVersion());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public int doEndTag() throws JspException {
		appendVersion();
		return super.doEndTag();
	}

	public String getBaseUrl() {
		return baseUrl;
	}

	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public boolean isGain() {
		return gain;
	}

	public void setGain(boolean gain) {
		this.gain = gain;
	}

	public boolean isInit() {
		return init;
	}

	public void setInit(boolean init) {
		this.init = init;
	}
}
