package com.fld.framework.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.type.TypeFactory;

/**
 * 
 * @author zhaokuner
 * 
 */
public class JacksonUtils {

	private static final ObjectMapper mapper = new ObjectMapper();

	private JacksonUtils() {
	}

	static {
		mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		mapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
		// mapper.setSerializationInclusion(JsonInclude.Include.NON_DEFAULT);
		mapper.configure(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT, true);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_NULL_FOR_PRIMITIVES, false);
		mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS, true);
		mapper.configure(JsonParser.Feature.ALLOW_SINGLE_QUOTES, true);
		mapper.configure(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS, false);
		mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
		// 不区分下划线 但是 属性集中不能存在驼峰式
		// mapper.setPropertyNamingStrategy(PropertyNamingStrategy.CAMEL_CASE_TO_LOWER_CASE_WITH_UNDERSCORES);
	}

	public static <T> T readValue(String jsonStr, Class<T> clazz) {
		if (null == jsonStr || jsonStr.isEmpty()) {
			return null;
		}
		try {
			T t = mapper.readValue(jsonStr, clazz);
			return t;
		} catch (Exception e) {
			CoreLogUtils.error(e.getMessage() + " json[" + jsonStr + "]", new Throwable(e));
		}
		return null;
	}

	/**
	 * json 字符串 转换成 List对象
	 * 
	 * @param <T>
	 * @param json
	 * @param tClazz
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> readListValue(String json, Class<T> tClazz) {
		return readValue(json, java.util.List.class, tClazz);
	}

	/**
	 * json 字符串 转换成 List对象
	 * 
	 * @param <T>
	 * @param json
	 * @param tClazz
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> ArrayList<T> readArrayListValue(String json, Class<T> tClazz) {
		return readValue(json, java.util.ArrayList.class, tClazz);
	}

	/**
	 * Json 字符串 转换成Collection对象
	 * 
	 * @param <U>
	 * @param <T>
	 * @param json
	 * @param uClazz
	 * @param tClazz
	 * @return
	 */
	public static <U extends Collection<T>, T> U readValue(String json, Class<U> uClazz, Class<T> tClazz) {
		try {
			return mapper.readValue(json, TypeFactory.defaultInstance().constructCollectionType(uClazz, tClazz));
		} catch (Exception e) {
			CoreLogUtils.error(e.getMessage() + " json[" + json + "]", new Throwable(e));
		}
		return null;
	}

	/**
	 * json 转换成Map
	 * 
	 * @param <T>
	 * @param json
	 * @param tClazz
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> HashMap<String, T> readMapValue(String json, Class<T> tClazz) {
		return readMapValue(json, java.util.HashMap.class, tClazz);
	}

	/**
	 * json 转换成Map
	 * 
	 * @param <U>
	 * @param <T>
	 * @param json
	 * @param uClazz
	 * @param tClazz
	 * @return
	 */
	public static <U extends Map<String, T>, T> U readMapValue(String json, Class<U> uClazz, Class<T> tClazz) {
		try {
			return mapper.readValue(json, TypeFactory.defaultInstance().constructMapType(uClazz, java.lang.String.class, tClazz));
		} catch (Exception e) {
			CoreLogUtils.error(e.getMessage() + " json[" + json + "]", new Throwable(e));
		}
		return null;
	}

	public static String toJson(Object t) {

		String result = null;
		if (t == null) {
			return result;
		}
		try {
			result = mapper.writeValueAsString(t);
		} catch (Exception e) {
			CoreLogUtils.error(e.getMessage(), new Throwable(e));
		}
		return result;
	}

}
