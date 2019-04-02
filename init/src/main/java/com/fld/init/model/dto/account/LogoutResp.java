package com.fld.init.model.dto.account;

import com.fld.framework.dto.api.ApiRespData;

public class LogoutResp extends ApiRespData {

  private static final long serialVersionUID = 2790670709637486975L;
  /**
   * 退出成功
   */
  private Boolean result;

  public LogoutResp() {
    super();
  }

  public LogoutResp(Boolean result) {
    super();
    this.result = result;
  }

  public Boolean getResult() {
    return result;
  }

  public void setResult(Boolean result) {
    this.result = result;
  }

}
