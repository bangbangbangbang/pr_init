package com.fld.init.model.dto.testcre;


import com.fld.framework.dto.api.ApiResolveRespData;

public class TestCreListResp extends ApiResolveRespData {

  /**
   * 
   */
  private static final long serialVersionUID = 1L;

  private TestCreResp[] list;

  public TestCreResp[] getList() {
    return list;
  }

  public void setList(TestCreResp[] list) {
    this.list = list;
  }
}

