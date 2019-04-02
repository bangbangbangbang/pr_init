package com.fld.framework.util.server;

import javax.servlet.ServletContext;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import com.fld.framework.util.IpUtils;
import com.fld.framework.util.server.bean.ServerConfig;
import com.fld.framework.util.server.core.Jetty6Server;
import com.fld.framework.util.server.core.TomcatServer;
import com.fld.framework.util.server.enums.ServerTypeEnum;

/**
 * @Title: ServerUtils.java
 * @Package com.fld.framework.util.server
 * @author Tandy
 * @Company www.zhaokuner.com
 * @date 2015年8月5日 上午9:21:43
 * @version V1.0
 */
public class ServerUtils {

	private static Logger logger = Logger.getLogger(ServerUtils.class);

	public static ServerConfig getConfig(ServletContext context, ServerTypeEnum serverTypeEnum) {

		ServerConfig result = null;
		if (context == null) {
			logger.error("the ServletContext is null.");
			return result;
		}

		if (serverTypeEnum == null || !ServerTypeEnum.isEnum(serverTypeEnum.getCode())) {
			logger.error("the ServerTypeEnum is invalid .");
		}

		result = new ServerConfig();
		String ip = IpUtils.getLocalIpAddr();

		if (StringUtils.isNotBlank(ip)) {
			result.setServiceIp(ip);
		}

		Integer port = null;

		if (serverTypeEnum.getCode() == ServerTypeEnum.JETTY6.getCode()) {
			port = getJetty6(context);
		} else if (serverTypeEnum.getCode() == ServerTypeEnum.TOMCAT.getCode()) {
			port = getTomcat(context);
		}

		if (port != null) {
			result.setServicePort(port);
		}

		return result;
	}

	/**
	 * 
	 * @Title: getJetty6 @Description: 获取Jetty6容器端口 @param context @return Integer 返回类型 @throws
	 */
	protected static Integer getJetty6(ServletContext context) {
		Integer result = null;
		if (context == null) {
			return result;
		}
		Jetty6Server jetty6 = new Jetty6Server(context);
		if (jetty6 != null) {
			result = jetty6.getPort();
		}
		return result;
	}

	/**
	 * 
	 * @Title: getTomcat @Description: 获取Tomcat容器端口 @param context @return Integer 返回类型 @throws
	 */
	protected static Integer getTomcat(ServletContext context) {
		Integer result = null;
		if (context == null) {
			return result;
		}
		TomcatServer tomcat = new TomcatServer(context);

		if (tomcat != null) {
			result = tomcat.getPort();
		}
		return result;
	}
}
