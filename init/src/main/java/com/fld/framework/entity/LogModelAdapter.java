package com.fld.framework.entity;

import org.apache.log4j.Logger;

/**
 * 
 * @Description: 对象生成log接口,根据具体需要生成对应数据格式。数据库字段顺序需与类型属性上下顺序一致 <br>
 *               数据默认以|分割，数据内含有|则会使数据导入时出问题 <br>
 */
public class LogModelAdapter implements LogModel {

	/**
	 * this.getClass()
	 */
	protected final Logger logger = Logger.getLogger(this.getClass().getSimpleName());

	/**
	 * "|"
	 */
	protected static final String decollator = "|";

	@Override
	public Logger getLogger() {
		return logger;
	}

	@Override
	public String toLog() {
		return toString();
	}

}
