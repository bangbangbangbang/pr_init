package com.fld.framework.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Consumer;
import com.fld.framework.annotation.Ignore;
import com.fld.framework.exception.IllegalArgumentException;;

public abstract class TransBeanMap {

	@FunctionalInterface
	public static interface DealFeild<T> {
		void deal(String name, Object value, T t);
	}

	private static ConcurrentHashMap<String, PropertyDescriptor[]> propertyDescriptorMap = new ConcurrentHashMap<>();
	private static ConcurrentHashMap<String, LinkedHashMap<String, Field>> feildMap = new ConcurrentHashMap<>();

	public static PropertyDescriptor[] propertyDescriptor(Object obj) throws IntrospectionException {
		if (null == obj) {
			return null;
		}
		PropertyDescriptor[] pd = propertyDescriptorMap.get(obj.getClass().getName());
		if (null != pd) {
			return pd;
		}
		synchronized (TransBeanMap.class) {
			BeanInfo beanInfo = Introspector.getBeanInfo(obj.getClass());
			pd = beanInfo.getPropertyDescriptors();
			ArrayList<PropertyDescriptor> list = new ArrayList<>();

			LinkedHashMap<String, Field> lhm = feilds(obj);
			Set<String> keySet = lhm.keySet();
			for (String s : keySet) {
				for (PropertyDescriptor p : pd) {
					if (p.getName().equals(s)) {
						list.add(p);
						continue;
					}
				}
			}
			pd = new PropertyDescriptor[list.size()];
			list.toArray(pd);
			propertyDescriptorMap.put(obj.getClass().getName(), pd);
		}
		return pd;

	}

	public static LinkedHashMap<String, Field> feilds(Object obj) throws IntrospectionException {
		if (null == obj) {
			return null;
		}
		LinkedHashMap<String, Field> map = feildMap.get(obj.getClass().getName());
		if (null == map) {
			synchronized (TransBeanMap.class) {
				map = new LinkedHashMap<>();

				Field[] fs = obj.getClass().getDeclaredFields();
				for (Field f : fs) {
					map.put(f.getName(), f);
				}
				feildMap.put(obj.getClass().getName(), map);
			}
		}
		return map;

	}

	public static <T> void foreachFeild(T t, DealFeild<T> dealFeild) throws Exception {
		if (null == t) {
			return;
		}
		PropertyDescriptor[] propertyDescriptors = propertyDescriptor(t);
		HashMap<String, Field> fs = feilds(t);
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();
			// 过滤class属性
			if (!key.equals("class")) {
				if (fs.get(key).isAnnotationPresent(Ignore.class)) {
					continue;
				}
				// 得到property对应的getter方法
				Method getter = property.getReadMethod();
				Object value = getter.invoke(t);
				dealFeild.deal(key, value, t);
			}

		}
	}

	public static <T> void foreach(T t, Consumer<PropertyDescriptor> c) throws Exception {
		if (null == t) {
			return;
		}
		PropertyDescriptor[] propertyDescriptors = propertyDescriptor(t);
		HashMap<String, Field> fs = feilds(t);
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();
			// 过滤class属性
			if (!key.equals("class")) {
				if (fs.get(key).isAnnotationPresent(Ignore.class)) {
					continue;
				}
				c.accept(property);
			}

		}
	}

	public static String underlineToCamel(String param) {
		if (param == null || "".equals(param.trim())) {
			return "";
		}
		int len = param.length();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++) {
			char c = param.charAt(i);
			if (c == '_') {
				if (++i < len) {
					sb.append(Character.toUpperCase(param.charAt(i)));
				}
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

	/**
	 * 下划线 转驼峰<br>
	 * Map --> Bean 1: 利用Introspector,PropertyDescriptor实现 Map --> Bean
	 * 
	 * @param bean
	 * @param map
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void transMap2CamelCase2Bean(Object bean, HashMap<String, Object> map) throws Exception {
		if (null == bean || null == map) {
			return;
		}
		ArrayList<Map.Entry<String, Object>> temp = new ArrayList<>();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			if (entry.getKey().contains("_")) {
				temp.add(entry);
			}

		}
		for (Map.Entry<String, Object> entry : temp) {
			map.remove(entry.getKey());
			String key = underlineToCamel(entry.getKey());
			map.put(key, entry.getValue());
		}

		PropertyDescriptor[] propertyDescriptors = propertyDescriptor(bean);
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();

			if (map.containsKey(key)) {
				Object value = map.get(key);
				// 得到property对应的setter方法
				Method setter = property.getWriteMethod();
				if (null != setter)
					setter.invoke(bean, value);
			}

		}
	}

	/**
	 * Map --> Bean 1: 利用Introspector,PropertyDescriptor实现 Map --> Bean
	 * 
	 * @param bean
	 * @param map
	 * @throws InvocationTargetException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static void transMap2Bean(Object bean, HashMap<String, Object> map) throws Exception {
		if (null == bean || null == map) {
			return;
		}
		PropertyDescriptor[] propertyDescriptors = propertyDescriptor(bean);
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();

			if (map.containsKey(key)) {
				Object value = map.get(key);
				// 得到property对应的setter方法
				Method setter = property.getWriteMethod();
				if (null != setter)
					setter.invoke(bean, value);
			}

		}
	}

	/**
	 * Map --> Bean 1: 利用Introspector,PropertyDescriptor实现 Map --> Bean
	 * 
	 * @param map
	 * @param obj
	 */
	public void transMap2Bean(HashMap<String, Object> map) {
		try {
			transMap2Bean(this, map);
		} catch (Exception e) {
			e.printStackTrace();
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * Bean --> Map 利用Introspector和PropertyDescriptor 将Bean --> Map
	 * 
	 * @param bean
	 * @return
	 */
	public static HashMap<String, Object> transBean2Map(Object bean) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		PropertyDescriptor[] propertyDescriptors = propertyDescriptor(bean);
		for (PropertyDescriptor property : propertyDescriptors) {
			String key = property.getName();

			// 过滤class属性
			if (!key.equals("class")) {
				// 得到property对应的getter方法
				Method getter = property.getReadMethod();
				Object value = getter.invoke(bean);

				map.put(key, value);
			}

		}

		return map;

	}

	/**
	 * Bean --> Map 利用Introspector和PropertyDescriptor 将Bean --> Map
	 * 
	 * @param obj
	 * @return
	 */
	public HashMap<String, Object> transBean2Map() {
		try {
			return transBean2Map(this);
		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}
	}

	/**
	 * bean的属性拷贝（浅拷贝），仅拷贝不为null的属性 orig --> dest
	 * 
	 * @param dest
	 * @param orig
	 * @throws IllegalArgumentException
	 */
	public static <T> void mergeBean(T dest, T orig) {
		if (null == dest || null == orig) {
			return;
		}
		try {
			foreach(orig, (pd) -> {
				Method rm = pd.getReadMethod();
				Method wm = pd.getWriteMethod();
				try {
					Object object = rm.invoke(orig);
					if (null != object) {
						wm.invoke(dest, object);
					}
				} catch (Exception e) {
					throw new IllegalArgumentException(e);
				}
			});

		} catch (Exception e) {
			throw new IllegalArgumentException(e);
		}

	}

}
