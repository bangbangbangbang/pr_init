package com.fld.framework.entity;

import java.io.Serializable;
import java.util.HashMap;
import org.apache.commons.lang3.StringUtils;
import com.fld.framework.util.TransBeanMap;

/**
 * 数据请求类
 * 
 * @author
 *
 */
public class BaseReq extends TransBeanMap implements Serializable {

  /**
   * 
   */
  private static final long serialVersionUID = 7511579622776081491L;

  /** 页码 */
  protected int pageIndex = 1;
  /** 单页条数 */
  protected int pageSize = 10;
  /** 分页标识 */
  protected String pageMark;
  /** 开始条数 */
  protected int beginIndex = 0;
  /** 保存当前的页面，用于验证是否需要从新根据页面计算 **/
  private int pageIndexCurrent = 0;
  /** 数据排序 */
  protected String order;
  /** 排序字段 */
  protected String sortName;

  public static final String ORDER_ASC = "asc";
  public static final String ORDER_DESC = "desc";

  public void initPage(BaseReq req) {
    if (null == req) {
      return;
    }
    this.setOrder(req.getOrder());
    this.setPageIndex(req.getPageIndex());
    this.setPageSize(req.getPageSize());
    this.setPageMark(req.getPageMark());
    this.setSortName(req.getSortName());
  }

  public void setOrderAsc() {
    this.setOrder(ORDER_ASC);
  }

  public void setOrderDesc() {
    this.setOrder(ORDER_DESC);
  }

  public HashMap<String, Object> transBean2MapNotPaging() {
    HashMap<String, Object> map = this.transBean2Map();
    map.remove("pageIndex");
    map.remove("pageSize");
    map.remove("beginIndex");
    map.remove("order");
    map.remove("sortName");
    return map;
  }

  public boolean notBlankMark() {
    return StringUtils.isNotBlank(pageMark);
  }

  public Integer getBeginIndex() {
    if (Integer.MAX_VALUE == pageSize) {
      return null;
    }
    if (pageIndexCurrent != pageIndex) {
      beginIndex = (this.pageIndex - 1) * pageSize;
      pageIndexCurrent = pageIndex;
    }
    return beginIndex;
  }

  public void setBeginIndex(int beginIndex) {
    this.beginIndex = beginIndex;
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
