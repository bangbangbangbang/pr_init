package com.fld.framework.util;

import org.apache.commons.lang3.math.NumberUtils;

/**
 * 
 * @ClassName: NumDealUtil
 * @Description: 处理数字
 * @author zhaokuner
 * @date 2016年8月9日 下午4:06:34
 *
 */
public class NumDealUtil extends NumberUtils {

	public static Integer defaultNull(Integer o) {
		return null != o ? o : 0;
	}

	public static Integer defaultNull(Integer o, int i) {
		return null != o ? o : i;
	}

	public static Long defaultNull(Long o) {
		return null != o ? o : 0L;
	}

	public static Long defaultNull(Long o, long l) {
		return null != o ? o : l;
	}

	public static Double defaultNull(Double o) {
		return null != o ? o : 0.0;
	}

	public static Double defaultNull(Double o, double d) {
		return null != o ? o : d;
	}

	public static Float defaultNull(Float o) {
		return null != o ? o : 0.0F;
	}

	public static Float defaultNull(Float o, float f) {
		return null != o ? o : f;
	}

}
