package com.fld.framework.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * 返回列表数据基类 带分页
 * 
 * @author
 * 
 * @param <T>
 */
public class BaseList<T> extends BaseResp {

  private static final long serialVersionUID = 7661982863421965725L;

  private int totalRows;

  private int totalPage;

  private int curPage;

  private int pageSize;

  private String pageMark;

  private List<T> list = new ArrayList<T>();

  public BaseList() {
    super.success();
  }

  public BaseList(BaseReq req) {
    this();
    initPageInfo(req);
  }

  public BaseList<T> putBaseResp(BaseResp baseResp) {
    this.setCode(baseResp.getCode());
    this.setMsg(baseResp.getMsg());
    this.setExt(baseResp.getExt());
    return this;
  }

  public void initPageInfo(BaseReq req) {
    this.setCurPage(req.getPageIndex());
    this.setPageSize(req.getPageSize());
    this.setPageMark(req.getPageMark());
  }

  public void initPageInfo(BaseList<?> baseList) {
    if (null != baseList) {
      this.setTotalPage(baseList.getTotalPage());
      this.setTotalRows(baseList.getTotalRows());
      this.setCurPage(baseList.getCurPage());
      this.setPageSize(baseList.getPageSize());
      this.setPageMark(baseList.getPageMark());
    }
  }

  public void addListItem(T t) {
    list.add(t);
  }

  public int getTotalRows() {
    return totalRows;
  }

  public void setTotalRows(int totalRows) {
    this.totalRows = totalRows;
  }

  /**
   * 计算总页码
   */
  public static int getTotalPage(int pageSize, int totalRows) {
    int totalPage = 0;
    if (0 != pageSize && 0 != totalRows) {
      totalPage = totalRows % pageSize == 0 ? totalRows / pageSize : totalRows / pageSize + 1;
    }
    return totalPage;
  }

  public int getTotalPage() {
    if (0 != pageSize && 0 != totalRows) {
      totalPage = totalRows % pageSize == 0 ? totalRows / pageSize : totalRows / pageSize + 1;
    }
    return totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

  public int getCurPage() {
    return curPage;
  }

  public void setCurPage(int curPage) {
    this.curPage = curPage;
  }

  public int getPageSize() {
    return pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public List<T> getList() {
    return list;
  }

  public void setList(List<T> list) {
    this.list = list;
  }

  public String getPageMark() {
    return pageMark;
  }

  public void setPageMark(String pageMark) {
    this.pageMark = pageMark;
  }
}
