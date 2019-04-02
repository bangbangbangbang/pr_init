package com.fld.framework.entity;

import java.util.HashMap;

/**
 * 请求数据Map包装
 * 
 * @author
 *
 */
public class BaseReqParams {

  HashMap<String, Object> map = new HashMap<String, Object>();

  /** 页码 */
  private int pageIndex = 1;
  /** 单页条数 */
  private int pageSize = 10;
  /** 分页标识 */
  private String pageMark;
  /** 开始条数 */
  private int beginIndex = 0;
  /** 数据排序 */
  private String order;
  /** 排序字段 */
  private String sortName;

  public void put(String key, Object value) {
    map.put(key, value);
  }

  public void remove(String key) {
    map.remove(key);
  }

  public HashMap<String, Object> toNoPageHashMap() {
    map.put("order", this.getOrder());
    map.put("sortName", this.getSortName());
    return map;
  }

  public HashMap<String, Object> toHashMap() {
    map.put("beginIndex", this.getBeginIndex());
    map.put("pageSize", this.getPageSize());
    map.put("pageMark", this.getPageMark());
    map.put("order", this.getOrder());
    map.put("sortName", this.getSortName());
    return map;
  }

  public static String ORDER_ASC = "asc";
  public static String ORDER_DESC = "desc";

  public void setOrderAsc() {
    this.setOrder(ORDER_ASC);
  }

  public void setOrderDesc() {
    this.setOrder(ORDER_DESC);
  }

  public Integer getBeginIndex() {
    if (Integer.MAX_VALUE == pageSize) {
      return null;
    }
    if (0 == beginIndex) {
      beginIndex = (this.pageIndex - 1) * pageSize;
    }
    return beginIndex;
  }

  public int getPageIndex() {
    return pageIndex;
  }

  public void setPageIndex(int pageIndex) {
    this.pageIndex = pageIndex;
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public String getPageMark() {
    return pageMark;
  }

  public void setPageMark(String pageMark) {
    this.pageMark = pageMark;
  }

  public String getOrder() {
    return order;
  }

  public void setOrder(String order) {
    this.order = order;
  }

  public String getSortName() {
    return sortName;
  }

  public void setSortName(String sortName) {
    this.sortName = sortName;
  }

}
