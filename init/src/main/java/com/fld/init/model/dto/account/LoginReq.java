package com.fld.init.model.dto.account;

import com.fld.framework.dto.api.ApiReq;

public class LoginReq extends ApiReq {

  /**
   * 
   */
  private static final long serialVersionUID = 8672954251121194855L;

  private String code;
  private boolean autologin;
  private String redirectUrl;

  /**
   * 登录账号
   */
  private String account;

  /**
   * 登录密码，前端MD5加密传输到后端，后端在结合盐值再执行一次MD5才存储
   */
  private String password;
  /**
   * 会话有效时长
   */
  private Integer scopeTime;

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public Integer getScopeTime() {
    return scopeTime;
  }

  public void setScopeTime(Integer scopeTime) {
    this.scopeTime = scopeTime;
  }

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public boolean isAutologin() {
    return autologin;
  }

  public void setAutologin(boolean autologin) {
    this.autologin = autologin;
  }

  public String getRedirectUrl() {
    return redirectUrl;
  }

  public void setRedirectUrl(String redirectUrl) {
    this.redirectUrl = redirectUrl;
  }

}
