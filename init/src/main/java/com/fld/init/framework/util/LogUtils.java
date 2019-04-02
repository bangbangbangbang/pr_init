package com.fld.init.framework.util;

import org.apache.log4j.Logger;
import com.fld.framework.util.CoreLogUtils;

public class LogUtils extends CoreLogUtils {

	/** 访问日志 */
	protected static final Logger ACCESS_LOG = Logger.getLogger("access");

	/** 接口层 API 日志 **/
	protected static final Logger SERVICE_API_LOG = Logger.getLogger("api");

	/** 业务服务日志 */
	protected static final Logger SERVICE_LOG = Logger.getLogger("service");

	/** 调式日志 */
	protected static final Logger DEBUG_LOG = Logger.getLogger("debug");

	/** 性能 */
	protected static final Logger PERF_LOG = Logger.getLogger("perf");

	/** 未被处理，被系统捕获的例外 */
	protected static final Logger EXCEPTION_LOG = Logger.getLogger("exception");

	/** RPC日志 */
	protected static final Logger SERVICE_RPC_LOG = Logger.getLogger("rpc");
	/*** 通知人工处理 **/
	protected static final Logger NOTIFY = Logger.getLogger("notify");
	/*** 三千问 **/
	protected static final Logger KNOWLEDGE = Logger.getLogger("knowledge");
	/*** 喵姐说 **/
	protected static final Logger COURSE = Logger.getLogger("course");

	/** CTRL访问日志 **/
	protected static final Logger CTRL = Logger.getLogger("ctrl");

	/*** 通知人工处理 **/
	public static void notifyLog(String log) {
		NOTIFY.warn(log);
	}

	public static void serviceRpcLog(String log) {
		SERVICE_RPC_LOG.info(log);
	}

	public static void perfLog(String log) {
		PERF_LOG.info(log);
	}

	public static void perfDebugLog(String log) {
		if (PERF_LOG.isDebugEnabled()) {
			PERF_LOG.debug(log);
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

	public static void serviceLog(String message) {
		SERVICE_LOG.info(message);
	}

	public static boolean serviceIsDebugEnabled() {
		return SERVICE_LOG.isDebugEnabled();
	}

	public static void serviceDebugLog(String message) {
		if (SERVICE_LOG.isDebugEnabled()) {
			SERVICE_LOG.debug(message);
		}
	}

	public static void error(String message, Throwable e) {
		EXCEPTION_LOG.error(message, e);
	}

	public static void error(String message) {
		EXCEPTION_LOG.error(message);
	}

	public static void knowledge(String message) {
		KNOWLEDGE.info(message);
	}

	public static void ctrl(String message) {
		CTRL.info(message);
	}

	public static void course(String message) {
		COURSE.info(message);
	}

}
