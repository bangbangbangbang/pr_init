package com.fld.init.framework.util;

import java.util.UUID;
import java.util.regex.Pattern;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import com.fld.framework.util.GenerateUtil;
import com.fld.init.framework.constant.Configuration;
import com.fld.init.model.enums.AccountOriginEnum;

public class AccountUtils {

	/**
	 * 前缀
	 */
	private static Pattern prefixPattern = Pattern.compile("^[mM][mM].*");
	public static final String PREFIX = "mm";

	/**
	 * 用户名的正则表达式
	 */
	private static Pattern loginNamePattern = Pattern.compile("^[\u4E00-\u9FA5a-zA-Z]{1}[\u4E00-\u9FA5_0-9a-zA-Z]{2,28}$");

	/**
	 * 邮箱的正则表达式
	 */
	private static Pattern emailPattern = Pattern.compile("^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$");

	/**
	 * 手机号的正则表达式
	 */
	private static Pattern telPattern = Pattern.compile("^[1-9]\\d{10}$");
	/**
	 * 非法的登录名称正则表达式
	 */
	private static Pattern incorrectLoginNamePattern = Pattern.compile(prefixPattern.pattern() + "|" + emailPattern.pattern() + "|" + telPattern.pattern());

	public static enum LengthKey {
		RNAME(5, 30), REMAIL(5, 35), RTel(11, 11);
		int minL;
		int maxL;

		private LengthKey(int minl, int maxl) {
			this.maxL = maxl;
			this.minL = minl;
		}
	}

	/**
	 * 验证账号类型
	 * 
	 * @param account
	 * @return AccountOriginEnum.EMAIL 包含"@"的字符串<br/>
	 *         AccountOriginEnum.TELEPHONE 纯数字<br/>
	 *         AccountOriginEnum.LOGIN_NAME 非纯数字<br/>
	 *         默认[null or "" ]为用户名
	 */
	public static AccountOriginEnum verifyAccountType(String account) {

		if (isCorrectEmail(account)) {
			return AccountOriginEnum.EMAIL;
		} else if (isCorrectTel(account)) {
			return AccountOriginEnum.TELEPHONE;
		} else if (!StringUtils.isNumeric(account) && loginNamePattern.matcher(account).matches()) {
			return AccountOriginEnum.LOGIN_NAME;
		}

		return AccountOriginEnum.OTHER;
	}

	/**
	 * 
	 * @Description:判断是否是登录名
	 * @param loginName
	 * @return boolean
	 */
	public static boolean isCorrectLoginName(String loginName) {
		return StringUtils.isBlank(loginName) ? false : (incorrectLoginNamePattern.matcher(loginName).matches() ? false : loginNamePattern.matcher(loginName).matches());
	}

	/**
	 * 
	 * @Description:是否合法的email
	 * @param email
	 * @return
	 * @return boolean
	 * 
	 */
	public static boolean isCorrectEmail(String email) {
		return StringUtils.isNotBlank(email) && emailPattern.matcher(email).matches();
	}

	/**
	 * 
	 * @Description: 是否合法的手机号
	 * @param tel
	 * @return
	 * @return boolean
	 * 
	 */
	public static boolean isCorrectTel(String tel) {
		return StringUtils.isNumeric(tel) && telPattern.matcher(tel).matches();
	}

	/**
	 * 
	 * 判断长度是否合法
	 * 
	 * @param args
	 */
	public static boolean isCorrectLength(LengthKey type, String name) {
		if (type == null || StringUtils.isBlank(name)) {
			return false;
		}
		// 如果是用户名，单独验证字节长度
		int len = getStrLength(name);
		return len >= type.minL && len <= type.maxL;
	}

	public static int getStrLength(String value) {
		int valueLength = 0;
		String chinese = "[\u0391-\uFFE5]";
		for (int i = 0; i < value.length(); i++) {
			String temp = value.substring(i, i + 1);
			if (temp.matches(chinese)) {
				valueLength += 2;
			} else {
				valueLength += 1;
			}
		}
		return valueLength;
	}

	/**
	 * UID | LoginTime | ServiceID | LoginType | random(3) Base64格式
	 * 
	 * @return
	 */
	public static String genSid(String uid, Integer loginTime, String serviceId, Integer loginType) {
		StringBuffer sid = new StringBuffer();
		sid.append(uid).append("|").append(loginTime).append("|").append(serviceId).append("|").append(loginType).append("|").append(GenerateUtil.getRandomStr(3));
		return Base64.encodeBase64URLSafeString(sid.toString().getBytes(Configuration.CHARSET));
	}

	/**
	 * serviceId（2位）+ 来源（1位）+ uuid +c(端)
	 * 
	 * @param serviceId
	 * @param type
	 * @return
	 */
	public static String genUid(String serviceId, String type) {
		StringBuffer sb = new StringBuffer();
		sb.append(serviceId).append(type).append(UUID.randomUUID().toString().replaceAll("-", "")).append("c");// c表示c端用户
		return sb.toString();
	}

	/**
	 * Cash 账号 10开头
	 * 
	 * @param no
	 * @return
	 */
	public static String genCashAccountNo(Long no) {
		if (null == no) {
			return null;
		}
		return "10" + StringUtils.leftPad(no.toString(), 10, "0");
	}

	public static void main(String[] args) {
		System.out.println(genUid("02", "3"));
	}
}
