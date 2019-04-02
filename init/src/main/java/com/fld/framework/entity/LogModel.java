package com.fld.framework.entity;

import org.apache.log4j.Logger;

/**
 * 
 * @Title LogModel.java
 * @Description: 对象生成log接口,根据具体需要生成对应数据格式 <br>
 */
public interface LogModel {
	/**
	 * 
	 * @return Logger
	 */
	Logger getLogger();

	/**
	 * 
	 * @Description:根据具体需要生成对应数据格式
	 * @return String
	 */
	String toLog();
}
