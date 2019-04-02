package com.fld.init.framework.constant;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;

public class ExpressionConfig {

	public static HashMap<String, String> map = new HashMap<>();

	static {
		init();
	}

	private static void init() {
		Properties prop = new Properties();
		try {
			prop.load(new InputStreamReader(ExpressionConfig.class.getClassLoader().getResourceAsStream("conf/expression.properties"), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			return;
		} catch (IOException e) {
			return;
		}
		Set<Entry<Object, Object>> it = prop.entrySet();
		for (Entry<Object, Object> entry : it) {
			Object key = entry.getKey();
			Object value = entry.getValue();
			map.put(key.toString(), value.toString());
		}
	}
}
