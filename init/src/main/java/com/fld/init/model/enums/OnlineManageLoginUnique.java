package com.fld.init.model.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * MULTIPOINT 多端登录 UNIQUE 单端登录
 * 
 * @author zhaokuner
 *
 */
public enum OnlineManageLoginUnique implements SuperEnum {

  /**
   * 多端登录
   */
  MULTIPOINT(0, "多端登录"),
  /**
   * 单端登录
   */
  UNIQUE(1, "单端登录");

  /**
   * @param code
   * @param description
   */
  private OnlineManageLoginUnique(int code, String description) {
    this.code = code;
    this.description = description;
    EnumUtils.put(this.getClass().getName() + code, this);
  }

  /**
   * <pre>
   * 一个便利的方法，方便使用者通过code获得枚举对象，
   * 对于非法状态，以个人处理&lt;/b&gt;
   * </pre>
   * 
   * @param code
   * @return
   */
  public static OnlineManageLoginUnique codeOf(Integer code) {
    Object obj = EnumUtils.get(OnlineManageLoginUnique.class.getName() + code);
    if (null != obj) {
      return (OnlineManageLoginUnique) obj;
    }
    return null;
  }

  /** 编码 */
  private int code;

  /** 描述的KEY */
  private String description;

  public int getCode() {
    return code;
  }

  public void setCode(int code) {
    this.code = code;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

}
