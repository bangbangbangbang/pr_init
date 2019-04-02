package com.fld.init.model;


import java.util.HashMap;
import java.util.Map;


public class TestCre implements java.io.Serializable {

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

  public TestCre() {}

  public TestCre(String id) {
    this.id = id;
  }


  public TestCre(TestCre testCre) {
    if (null != testCre) {
      this.setT1(testCre.getT1());
      this.setT2(testCre.getT2());
      this.setId(testCre.getId());
    }
  }

  public Map<String, Object> toMap() {
    HashMap<String, Object> map = new HashMap<>();
    map.put("t1", this.t1);
    map.put("t2", this.t2);
    map.put("id", this.id);
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

