package com.fld.init.framework.constant;

import com.fld.framework.constant.IBaseConstant;

public class ConstantParams implements IBaseConstant {
	/**
	 * logging.root System.setProperty("logging.root",port);
	 */
	public static final String SYSTEM_PROJECT_PORT = "project.port";
	/**
	 * project.ip System.setProperty("project.ip",ip);
	 */
	public static final String SYSTEM_PROJECT_IP = "project.ip";
	/**
	 * pattern.port 正则表达式key
	 */
	public static final String SYSTEM_PATTERN_PORT = "pattern.port";
	/**
	 * project.dubbo.port System.setProperty("project.dubbo.port",project.dubbo.port);
	 */
	public static final String SYSTEM_PROJECT_DUBBO_PORT = "project.dubbo.port";
	/**
	 * project.local 本地启动 System.setProperty("project.local",isLocal);
	 */
	public static final String SYSTEM_PROJECT_LOCAL = "project.local";
}
