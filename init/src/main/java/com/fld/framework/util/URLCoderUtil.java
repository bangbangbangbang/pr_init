package com.fld.framework.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class URLCoderUtil {
	public static String encodeUTF8(String url) {
		if (null == url || url.isEmpty()) {
			return url;
		}
		try {
			return URLEncoder.encode(url, StandardCharsets.UTF_8.name());
		} catch (UnsupportedEncodingException e) {
			CoreLogUtils.error("encodeUTF8 " + url, e);
			return url;
		}
	}

	public static String decodeUTF8(String url) {
		if (null == url || url.isEmpty()) {
			return url;
		}
		try {
			return URLDecoder.decode(url, StandardCharsets.UTF_8.name());
		} catch (UnsupportedEncodingException e) {
			CoreLogUtils.error("decodeUTF8 " + url, e);
			return url;
		}
	}

	public static String base64UrlSafeEncode(String data) {
		if (null == data || data.isEmpty()) {
			return data;
		}
		String res = new String(Base64.getUrlEncoder().encode(data.getBytes(StandardCharsets.UTF_8)), StandardCharsets.UTF_8);
		int l = res.length();
		if ('=' != res.charAt(l - 1)) {
			return res;
		} else if ('=' == res.charAt(l - 2)) {
			res = res.substring(0, l - 2);
		} else if ('=' == res.charAt(l - 1)) {
			res = res.substring(0, l - 1);
		}
		return res;
	}

	public static String base64UrlSafeDecode(String data) {
		return new String(Base64.getUrlDecoder().decode(data.getBytes(StandardCharsets.UTF_8)), StandardCharsets.UTF_8);
	}

}
