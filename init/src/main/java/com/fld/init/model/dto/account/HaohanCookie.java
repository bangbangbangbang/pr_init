/**
 * project name:wine-model
 * package name:com.sevenchildren.yzmm.model.dto.useraccount
 * file name:haohanCookie.java
 * type name:haohanCookie
 */
package com.fld.init.model.dto.account;

/**
 * @author zhaokuner
 * @Date 2015年8月10日 上午11:30:02
 * 
 */
public class HaohanCookie implements java.io.Serializable {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6875707117915006584L;
	// cookie key
	private String cookieKey;
	// cookie 值
	private String cookieValue;
	// cookie 有效时长
	private Integer scopeTime;

	public HaohanCookie() {
	}

	public HaohanCookie(String key, String value, Integer scopeTime) {
		this.cookieKey = key;
		this.cookieValue = value;
		this.scopeTime = scopeTime;
	}

	public String getCookieKey() {
		return cookieKey;
	}

	public void setCookieKey(String cookieKey) {
		this.cookieKey = cookieKey;
	}

	public String getCookieValue() {
		return cookieValue;
	}

	public void setCookieValue(String cookieValue) {
		this.cookieValue = cookieValue;
	}

	public Integer getScopeTime() {
		return scopeTime;
	}

	public void setScopeTime(Integer scopeTime) {
		this.scopeTime = scopeTime;
	}
}
