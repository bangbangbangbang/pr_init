package com.fld.framework.dto.api;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 返回数据 data基类 data为列表时
 * 
 * @author zhaokuner
 *
 * @param <T>
 */
public class ApiRespListData<T extends Serializable> extends ApiRespData implements Serializable {

  /**
   * 
   */
  private static final long serialVersionUID = 7699932531242472829L;

  protected int totalRows;
  private int totalPage;
  protected String pageMark;

  protected List<T> list = new ArrayList<T>();

  public T getListItem(int i) {
    return list.get(i);
  }

  public void addListItem(T e) {
    this.list.add(e);
  }

  public List<T> getList() {
    return list;
  }

  public void setList(List<T> list) {
    this.list = list;
  }

  public int getTotalRows() {
    return totalRows;
  }

  public void setTotalRows(int totalRows) {
    this.totalRows = totalRows;
  }

  public String getPageMark() {
    return pageMark;
  }

  public void setPageMark(String pageMark) {
    this.pageMark = pageMark;
  }

  public int getTotalPage() {
    return totalPage;
  }

  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }

}
