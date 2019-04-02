package com.fld.framework.constant;

import java.lang.reflect.Field;
import java.util.concurrent.ConcurrentHashMap;
import com.fld.framework.entity.BaseStatus;
import com.fld.framework.util.CoreLogUtils;

public class RespStatusUtil {

	private static final ConcurrentHashMap<Integer, BaseStatus> STATUS_MAP = new ConcurrentHashMap<>();

	private static final <T extends RespStatus> void defaultInitStatusMap(Class<T> clazz) {
		Field[] fields = clazz.getFields();
		for (Field field : fields) {
			try {
				Object o = field.get(null);
				if (o instanceof BaseStatus) {
					BaseStatus bs = (BaseStatus) o;
					STATUS_MAP.put(bs.getCode(), bs);
				}
			} catch (IllegalArgumentException | IllegalAccessException e) {
				CoreLogUtils.error("RespStatus.initStatusMap", e);
			}
		}
	}

	public static <T extends RespStatus> BaseStatus valueOf(Integer code, Class<T> clazz) {
		if (STATUS_MAP.size() <= 0) {
			defaultInitStatusMap(clazz);
		}
		return STATUS_MAP.get(code);
	}

}
