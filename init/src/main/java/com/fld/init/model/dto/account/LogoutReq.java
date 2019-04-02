package com.fld.init.model.dto.account;

import com.fld.framework.dto.api.ApiReq;

public class LogoutReq extends ApiReq {

  private static final long serialVersionUID = -1111493842260027243L;
  /**
   * 会话编号
   */
  private String sid;

  public String getSid() {
    return sid;
  }

  public void setSid(String sid) {
    this.sid = sid;
  }

}
