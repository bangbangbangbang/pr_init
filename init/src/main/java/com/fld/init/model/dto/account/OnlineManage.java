package com.fld.init.model.dto.account;

import java.util.HashMap;
import java.util.Map;

public class OnlineManage implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * id db_column: id
	 */
	private Long id;
	/**
	 * UID | LoginTime | ServiceID | LoginType Base64格式 db_column: sid
	 */
	private String sid;
	/**
	 * 用户ID db_column: uid
	 */
	private String uid;
	/**
	 * 登录账户 db_column: login_account
	 */
	private String loginAccount;
	/**
	 * 账户类型 0：login_name；1：telephone；2：email 3：QQ；4：sinaweibo； 5：weixin db_column: account_type
	 */
	private Integer accountType;
	/**
	 * 第三方openid db_column: open_id
	 */
	private String openId;
	/**
	 * 服务ID db_column: service_id
	 */
	private String serviceId;
	/**
	 * 登录方式 0 ：Web端；1： 移动端； 2： Wap端 db_column: login_type
	 */
	private Integer loginType;
	/**
	 * 是否唯一登陆 db_column: login_unique
	 */
	private Integer loginUnique;
	/**
	 * 用户在线有效时长，单位秒 db_column: scope_time
	 */
	private Integer scopeTime;
	/**
	 * 登录IP db_column: login_ip
	 */
	private String loginIp;
	/**
	 * 登录信息 db_column: login_info
	 */
	private String loginInfo;
	/**
	 * 登录次数 db_column: login_num
	 */
	private Integer loginNum;
	/**
	 * 登录时间 db_column: login_time
	 */
	private Integer loginTime;
	/**
	 * 上次登录时间 db_column: last_login_time
	 */
	private Integer lastLoginTime;
	/**
	 * 登录总时间 db_column: total_login_time
	 */
	private Integer totalLoginTime;
	/**
	 * 登录地址 db_column: login_addr
	 */
	private String loginAddr;
	/**
	 * 上次登录地址 db_column: last_login_addr
	 */
	private String lastLoginAddr;
	/**
	 * 刷新时间 db_column: flush_time
	 */
	private Integer flushTime;
	/**
	 * 备注 db_column: memo
	 */
	private String memo;
	/**
	 * 退出时间 db_column: logout_time
	 */
	private Integer logoutTime;
	/**
	 * 退出原因 0：正常玩家退出；1：玩家再次登录；2：超时自动清理 db_column: logout_reason
	 */
	private Integer logoutReason;
	/**
	 * 在线时长 db_column: online_time
	 */
	private Integer onlineTime;

	public OnlineManage() {
	}

	public OnlineManage(Long id) {
		this.id = id;
	}

	public OnlineManage(OnlineManage onlineManage) {
		if (null != onlineManage) {
			this.setId(onlineManage.getId());
			this.setSid(onlineManage.getSid());
			this.setUid(onlineManage.getUid());
			this.setLoginAccount(onlineManage.getLoginAccount());
			this.setAccountType(onlineManage.getAccountType());
			this.setOpenId(onlineManage.getOpenId());
			this.setServiceId(onlineManage.getServiceId());
			this.setLoginType(onlineManage.getLoginType());
			this.setLoginUnique(onlineManage.getLoginUnique());
			this.setScopeTime(onlineManage.getScopeTime());
			this.setLoginIp(onlineManage.getLoginIp());
			this.setLoginInfo(onlineManage.getLoginInfo());
			this.setLoginNum(onlineManage.getLoginNum());
			this.setLoginTime(onlineManage.getLoginTime());
			this.setLastLoginTime(onlineManage.getLastLoginTime());
			this.setTotalLoginTime(onlineManage.getTotalLoginTime());
			this.setLoginAddr(onlineManage.getLoginAddr());
			this.setLastLoginAddr(onlineManage.getLastLoginAddr());
			this.setFlushTime(onlineManage.getFlushTime());
			this.setMemo(onlineManage.getMemo());
			this.setLogoutTime(onlineManage.getLogoutTime());
			this.setLogoutReason(onlineManage.getLogoutReason());
			this.setOnlineTime(onlineManage.getOnlineTime());
		}
	}

	public Map<String, Object> toMap() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", this.id);
		map.put("sid", this.sid);
		map.put("uid", this.uid);
		map.put("loginAccount", this.loginAccount);
		map.put("accountType", this.accountType);
		map.put("openId", this.openId);
		map.put("serviceId", this.serviceId);
		map.put("loginType", this.loginType);
		map.put("loginUnique", this.loginUnique);
		map.put("scopeTime", this.scopeTime);
		map.put("loginIp", this.loginIp);
		map.put("loginInfo", this.loginInfo);
		map.put("loginNum", this.loginNum);
		map.put("loginTime", this.loginTime);
		map.put("lastLoginTime", this.lastLoginTime);
		map.put("totalLoginTime", this.totalLoginTime);
		map.put("loginAddr", this.loginAddr);
		map.put("lastLoginAddr", this.lastLoginAddr);
		map.put("flushTime", this.flushTime);
		map.put("memo", this.memo);
		map.put("logoutTime", this.logoutTime);
		map.put("logoutReason", this.logoutReason);
		map.put("onlineTime", this.onlineTime);
		return map;
	}

	public void setId(Long value) {
		this.id = value;
	}

	public Long getId() {
		return this.id;
	}

	public void setSid(String value) {
		this.sid = value;
	}

	public String getSid() {
		return this.sid;
	}

	public void setUid(String value) {
		this.uid = value;
	}

	public String getUid() {
		return this.uid;
	}

	public void setLoginAccount(String value) {
		this.loginAccount = value;
	}

	public String getLoginAccount() {
		return this.loginAccount;
	}

	public void setAccountType(Integer value) {
		this.accountType = value;
	}

	public Integer getAccountType() {
		return this.accountType;
	}

	public void setOpenId(String value) {
		this.openId = value;
	}

	public String getOpenId() {
		return this.openId;
	}

	public void setServiceId(String value) {
		this.serviceId = value;
	}

	public String getServiceId() {
		return this.serviceId;
	}

	public void setLoginType(Integer value) {
		this.loginType = value;
	}

	public Integer getLoginType() {
		return this.loginType;
	}

	public void setLoginUnique(Integer value) {
		this.loginUnique = value;
	}

	public Integer getLoginUnique() {
		return this.loginUnique;
	}

	public void setScopeTime(Integer value) {
		this.scopeTime = value;
	}

	public Integer getScopeTime() {
		return this.scopeTime;
	}

	public void setLoginIp(String value) {
		this.loginIp = value;
	}

	public String getLoginIp() {
		return this.loginIp;
	}

	public void setLoginInfo(String value) {
		this.loginInfo = value;
	}

	public String getLoginInfo() {
		return this.loginInfo;
	}

	public void setLoginNum(Integer value) {
		this.loginNum = value;
	}

	public Integer getLoginNum() {
		return this.loginNum;
	}

	public void setLoginTime(Integer value) {
		this.loginTime = value;
	}

	public Integer getLoginTime() {
		return this.loginTime;
	}

	public void setLastLoginTime(Integer value) {
		this.lastLoginTime = value;
	}

	public Integer getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setTotalLoginTime(Integer value) {
		this.totalLoginTime = value;
	}

	public Integer getTotalLoginTime() {
		return this.totalLoginTime;
	}

	public void setLoginAddr(String value) {
		this.loginAddr = value;
	}

	public String getLoginAddr() {
		return this.loginAddr;
	}

	public void setLastLoginAddr(String value) {
		this.lastLoginAddr = value;
	}

	public String getLastLoginAddr() {
		return this.lastLoginAddr;
	}

	public void setFlushTime(Integer value) {
		this.flushTime = value;
	}

	public Integer getFlushTime() {
		return this.flushTime;
	}

	public void setMemo(String value) {
		this.memo = value;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setLogoutTime(Integer value) {
		this.logoutTime = value;
	}

	public Integer getLogoutTime() {
		return this.logoutTime;
	}

	public void setLogoutReason(Integer value) {
		this.logoutReason = value;
	}

	public Integer getLogoutReason() {
		return this.logoutReason;
	}

	public void setOnlineTime(Integer value) {
		this.onlineTime = value;
	}

	public Integer getOnlineTime() {
		return this.onlineTime;
	}

}
