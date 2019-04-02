package com.fld.init.model.dto.account;

public class CookieSecurityKey implements java.io.Serializable {

	private static final long serialVersionUID = 4853705099665769001L;

	/**
	 * key
	 */
	private String securityKey;
	/**
	 * 有效时长
	 */
	private Integer scopeTime;
	/**
	 * 生成时间
	 */
	private Integer createTime;

	public String getSecurityKey() {
		return securityKey;
	}

	public void setSecurityKey(String securityKey) {
		this.securityKey = securityKey;
	}

	public Integer getScopeTime() {
		return scopeTime;
	}

	public void setScopeTime(Integer scopeTime) {
		this.scopeTime = scopeTime;
	}

	public Integer getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "CookieSecurityKey [securityKey=" + securityKey + ", scopeTime=" + scopeTime + ", createTime=" + createTime + "]";
	}

}
