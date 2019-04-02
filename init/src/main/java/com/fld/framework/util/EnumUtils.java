package com.fld.framework.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class EnumUtils implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -983144384462325670L;
	private static Map<String, Object> cache = new HashMap<String, Object>();

	public static void put(String key, Object value) {
		cache.put(key, value);
	}

	public static Object get(String key) {
		return cache.get(key);
	}

	public static Object getEnumByCode(Class<?> _class, String code) {
		Object o = EnumUtils.get(_class.getName() + code);
		if (null != o) {
			return o;
		}
		return null;
	}

}
