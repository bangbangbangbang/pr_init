package com.fld.framework.util.server.core;

import javax.servlet.ServletContext;
import org.apache.log4j.Logger;

/**
 * 应用服务器包装类. 用于适配，以读取各种服务器配置
 */
public abstract class ServerWrapper {

	protected Logger logger = Logger.getLogger(ServerWrapper.class);

	protected ServletContext context;

	/** 应用服务端口 */
	protected int port;

	public ServerWrapper(ServletContext context) {
		this.context = context;
		extractContext(context);
	}

	public ServletContext getServletContext() {
		return context;
	}

	public int getPort() {
		return port;
	}

	protected abstract void extractContext(ServletContext context);
}
