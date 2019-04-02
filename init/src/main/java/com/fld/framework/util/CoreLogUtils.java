package com.fld.framework.util;

import org.apache.log4j.Logger;
import com.fld.framework.entity.LogModel;

public class CoreLogUtils {

	/**
	 * 调式日志，
	 */
	protected static final Logger DEBUG_LOG = Logger.getLogger("debug");
	/**
	 * 访问路径
	 */
	protected static final Logger ACCESS_LOG = Logger.getLogger("access");
	/**
	 * 接口层 API 日志
	 */
	protected static final Logger SERVICE_API_LOG = Logger.getLogger("api");
	/**
	 * 业务服务日志
	 */
	protected static final Logger SERVICE_LOG = Logger.getLogger("service");
	/**
	 * 性能
	 */
	protected static final Logger PERF_LOG = Logger.getLogger("perf");

	/**
	 * 未被处理，被系统捕获的例外
	 */
	protected static final Logger ERROR_LOG = Logger.getLogger("error");

	public static void debugLog(String log) {
		if (DEBUG_LOG.isDebugEnabled()) {
			DEBUG_LOG.debug(log);
		}
	}

	public static void accessLog(String log) {
		ACCESS_LOG.info(log);
	}

	public static void serviceApiLog(String log) {
		SERVICE_API_LOG.info(log);
	}

	public static void serviceApiDebugLog(String log) {
		if (SERVICE_API_LOG.isDebugEnabled()) {
			SERVICE_API_LOG.debug(log);
		}
	}

	public static void serviceLog(String log) {
		SERVICE_LOG.info(log);
	}

	public static void serviceDebugLog(String log) {
		if (SERVICE_LOG.isDebugEnabled()) {
			SERVICE_LOG.debug(log);
		}
	}

	public static void perfLog(String log) {
		PERF_LOG.info(log);
	}

	public static void error(String log, Throwable e) {
		ERROR_LOG.error(log, e);
	}

	public static void error(String log) {
		ERROR_LOG.error(log);
	}

	public static void modelInfoLog(LogModel model) {
		model.getLogger().info(model.toLog());
	}

}
