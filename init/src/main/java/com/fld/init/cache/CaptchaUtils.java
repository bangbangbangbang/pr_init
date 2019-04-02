package com.fld.init.cache;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import com.fld.init.framework.constant.Configuration;
import com.fld.init.framework.util.CookieResoleUtils;
import com.fld.init.framework.util.LogUtils;

/**
 * 
 * @ClassName: CaptchaUtils
 * @Description: 工具类
 * @date 2012-8-31 上午10:38:08
 *
 */
@Component
public class CaptchaUtils {

	private static final String CAPTCHA_CACHE = ":captcha_code:";
	public static final int CAPTCHA_CACHE_TIMEOUT = 60 * 10;

	public static String defalutKey(String key) {
		return Configuration.PROJECT_SHORT_NAME + CAPTCHA_CACHE + key;
	}

	/**
	 * key 保存验证码
	 **/
	public static void verificationCode(String key, String vcode) {
		CommCacheUtil.set(defalutKey(key), CAPTCHA_CACHE_TIMEOUT, vcode);
	}

	public static boolean checkOnly(HttpServletRequest request, String code) {
		if (StringUtils.isBlank(code)) {
			return false;
		}
		String sessionId = CookieResoleUtils.getCookieSessionId();
		String vcode = CommCacheUtil.get(defalutKey(sessionId));
		return code.equals(vcode);
	}

	public static boolean checkAndLapse(HttpServletRequest request, String code) {
		if (StringUtils.isBlank(code)) {
			return false;
		}
		String sessionId = CookieResoleUtils.getCookieSessionId();
		String vcode = CommCacheUtil.get(defalutKey(sessionId));
		if (vcode != null) {
			CommCacheUtil.remove(defalutKey(sessionId));
		}
		return code.equals(vcode);
	}

	public static void generateCookieVcode(HttpServletRequest request, HttpServletResponse response, String sRand) {
		try {
			String sessionId = CookieResoleUtils.getCookieSessionId();
			if (sessionId == null) {
				sessionId = UUID.randomUUID().toString();
				CookieResoleUtils.addCookieSessionId(response, sessionId);
			}
			CaptchaUtils.verificationCode(sessionId, sRand);
		} catch (Exception e) {
			LogUtils.error("generate vcode error ", e);
		}

	}

}
