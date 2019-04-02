package com.fld.init.model.dto.testcre;


import java.util.HashMap;
import com.fld.framework.dto.api.ApiReq;
import com.fld.init.model.TestCre;


public class TestCreReq extends ApiReq {
  /**
   * 
   */
  private static final long serialVersionUID = 1L;


  /**
   * t1 db_column: t1
   */
  private Integer t1;
  /**
   * t2 db_column: t2
   */
  private String t2;
  /**
   * id db_column: id
   */
  private String id;

  public TestCreReq() {

  }

  public TestCreReq(TestCreReq testCreReq) {
    if (null != testCreReq) {
      this.setT1(testCreReq.getT1());
      this.setT2(testCreReq.getT2());
      this.setId(testCreReq.getId());
      this.setSortName(testCreReq.getSortName());
      this.setOrder(testCreReq.getOrder());
      this.setBeginIndex(testCreReq.getBeginIndex());
      this.setPageIndex(testCreReq.getPageIndex());
      this.setPageMark(testCreReq.getPageMark());
      this.setPageSize(testCreReq.getPageSize());
    }
  }

  public TestCreReq(TestCre testCre) {
    if (null != testCre) {
      this.setT1(testCre.getT1());
      this.setT2(testCre.getT2());
      this.setId(testCre.getId());
    }
  }

  public TestCre toTestCre() {
    TestCre testCre = new TestCre();
    testCre.setT1(this.getT1());
    testCre.setT2(this.getT2());
    testCre.setId(this.getId());
    return testCre;
  }

  public HashMap<String, Object> toMap() {
    HashMap<String, Object> map = new HashMap<>();
    map.put("t1", this.getT1());
    map.put("t2", this.getT2());
    map.put("id", this.getId());
    map.put("sortName", this.getSortName());
    map.put("order", this.getOrder());
    map.put("beginIndex", this.getBeginIndex());
    map.put("pageIndex", this.getPageIndex());
    map.put("pageMark", this.getPageMark());
    map.put("pageSize", this.getPageSize());
    return map;
  }

  public void setT1(Integer value) {
    this.t1 = value;
  }

  public Integer getT1() {
    return this.t1;
  }


  public void setT2(String value) {
    this.t2 = value;
  }

  public String getT2() {
    return this.t2;
  }


  public void setId(String value) {
    this.id = value;
  }

  public String getId() {
    return this.id;
  }



}

