package com.fld.init.model.dto.account;

import java.util.HashMap;
import java.util.Map;
import com.fld.framework.dto.api.ApiRespData;
import com.fld.framework.enums.AccessTypeEnum;
import com.fld.framework.enums.SuperEnum;
import com.fld.init.model.enums.AccountOriginEnum;
import com.fld.init.model.enums.OnlineManageLoginUnique;
import com.fld.init.model.enums.UserStatusEnum;



public class LoginResp extends ApiRespData {

  /**
   * 
   */
  private static final long serialVersionUID = -8098529261706720679L;
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
  private AccountOriginEnum accountType;
  /**
   * 第三方openid
   */
  private String openId;
  /**
   * 服务ID db_column: service_id
   */
  private String serviceId;
  /**
   * 登录方式 0 ：Web端；1： 移动端； 2： Wap端 db_column: login_type
   */
  private AccessTypeEnum loginType;
  /**
   * loginUnique db_column: login_unique
   */
  private OnlineManageLoginUnique loginUnique;
  /**
   * 用户在线有效时长，单位秒 db_column: scope_time
   */
  private Integer scopeTime;
  /**
   * 登录IP db_column: login_ip
   */
  private String loginIp;
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
   * 用户状态
   */
  private UserStatusEnum status;

  /**
   * 登录cookie db_column: loginCookie
   */
  private HaohanCookie[] loginCookie;

  public LoginResp() {

  }

  public LoginResp(OnlineManage onlineManage) {
    if (null != onlineManage) {
      this.id = onlineManage.getId();
      this.sid = onlineManage.getSid();
      this.uid = onlineManage.getUid();
      this.loginAccount = onlineManage.getLoginAccount();
      this.accountType = AccountOriginEnum.codeOf(onlineManage.getAccountType());
      this.openId = onlineManage.getOpenId();
      this.serviceId = onlineManage.getServiceId();
      this.loginType = AccessTypeEnum.codeOf(onlineManage.getLoginType());
      this.loginUnique = OnlineManageLoginUnique.codeOf(onlineManage.getLoginUnique());
      this.scopeTime = onlineManage.getScopeTime();
      this.loginIp = onlineManage.getLoginIp();
      this.loginNum = onlineManage.getLoginNum();
      this.loginTime = onlineManage.getLoginTime();
      this.lastLoginTime = onlineManage.getLastLoginTime();
      this.loginAddr = onlineManage.getLoginAddr();
      this.lastLoginAddr = onlineManage.getLastLoginAddr();
      this.flushTime = onlineManage.getFlushTime();
      this.memo = onlineManage.getMemo();
    }
  }

  public OnlineManage toOnlineManage() {
    OnlineManage onlineManage = new OnlineManage();
    onlineManage.setId(this.id);
    onlineManage.setSid(this.sid);
    onlineManage.setUid(this.uid);
    onlineManage.setLoginAccount(this.loginAccount);
    onlineManage.setAccountType(null == this.accountType ? null : this.accountType.getCode());
    onlineManage.setOpenId(this.openId);
    onlineManage.setServiceId(this.serviceId);
    onlineManage.setLoginType(null == this.loginType ? null : this.loginType.getCode());
    onlineManage.setLoginUnique(null == this.loginUnique ? null : this.loginUnique.getCode());
    onlineManage.setScopeTime(this.scopeTime);
    onlineManage.setLoginIp(this.loginIp);
    onlineManage.setLoginNum(this.loginNum);
    onlineManage.setLoginTime(this.loginTime);
    onlineManage.setLastLoginTime(this.lastLoginTime);
    onlineManage.setLoginAddr(this.loginAddr);
    onlineManage.setLastLoginAddr(this.lastLoginAddr);
    onlineManage.setFlushTime(this.flushTime);
    onlineManage.setMemo(this.memo);
    return onlineManage;
  }

  public LoginCookie toLoginCookie() {
    LoginCookie loginCookie = new LoginCookie();
    loginCookie.setSid(this.sid);
    loginCookie.setUid(this.uid);
    loginCookie.setLoginIp(this.loginIp);
    loginCookie.setLoginTime(this.loginTime);
    loginCookie.setLoginAccount(this.loginAccount);
    loginCookie.setFlushTime(this.flushTime);
    loginCookie.setCookieScopeTime(this.scopeTime);
    loginCookie.setOnlineScopeTime(this.scopeTime);
    loginCookie.setAccountType(this.accountType);
    loginCookie.setOpenId(this.openId);
    loginCookie.setStatus(this.status);
    return loginCookie;
  }

  public Map<String, Object> toMap() {
    HashMap<String, Object> map = new HashMap<>();
    map.put("id", this.id);
    map.put("sid", this.sid);
    map.put("uid", this.uid);
    map.put("loginAccount", this.loginAccount);
    map.put("accountType", null == this.accountType ? null : this.accountType.getCode());
    map.put("openId", this.openId);
    map.put("serviceId", this.serviceId);
    map.put("loginType", null == this.loginType ? null : this.loginType.getCode());
    map.put("loginUnique", null == this.loginUnique ? null : this.loginUnique.getCode());
    map.put("scopeTime", this.scopeTime);
    map.put("loginIp", this.loginIp);
    map.put("loginNum", this.loginNum);
    map.put("loginTime", this.loginTime);
    map.put("lastLoginTime", this.lastLoginTime);
    map.put("loginAddr", this.loginAddr);
    map.put("lastLoginAddr", this.lastLoginAddr);
    map.put("flushTime", this.flushTime);
    map.put("maxFlushTime", this.maxFlushTime);
    map.put("minFlushTime", this.minFlushTime);
    map.put("memo", this.memo);
    map.put("status", SuperEnum.getCode(this.status));
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

  public void setServiceId(String value) {
    this.serviceId = value;
  }

  public String getServiceId() {
    return this.serviceId;
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

  private Integer minFlushTime;
  private Integer maxFlushTime;

  public void setMinFlushTime(Integer value) {
    this.minFlushTime = value;
  }

  public Integer getMinFlushTime() {
    return this.minFlushTime;
  }

  public void setMaxFlushTime(Integer value) {
    this.maxFlushTime = value;
  }

  public Integer getMaxFlushTime() {
    return this.maxFlushTime;
  }

  public void setMemo(String value) {
    this.memo = value;
  }

  public String getMemo() {
    return this.memo;
  }

  public AccountOriginEnum getAccountType() {
    return accountType;
  }

  public void setAccountType(AccountOriginEnum accountType) {
    this.accountType = accountType;
  }

  public AccessTypeEnum getLoginType() {
    return loginType;
  }

  public void setLoginType(AccessTypeEnum loginType) {
    this.loginType = loginType;
  }

  public OnlineManageLoginUnique getLoginUnique() {
    return loginUnique;
  }

  public void setLoginUnique(OnlineManageLoginUnique loginUnique) {
    this.loginUnique = loginUnique;
  }

  public HaohanCookie[] getLoginCookie() {
    return loginCookie;
  }

  public void setLoginCookie(HaohanCookie[] loginCookie) {
    this.loginCookie = loginCookie;
  }

  public String getOpenId() {
    return openId;
  }

  public void setOpenId(String openId) {
    this.openId = openId;
  }

  public UserStatusEnum getStatus() {
    return status;
  }

  public void setStatus(UserStatusEnum status) {
    this.status = status;
  }
}
