/**
*
*/
package com.fld.framework.enums;

import com.fld.framework.util.EnumUtils;

/**
 * WEB Web端 API 移动端 WAP Wap端 WEIXIN 微信端 APP 手机app端 <br>
 * 访问类型 0 Web端 1 接口端 2WAP端
 */
public enum AccessTypeEnum implements SuperEnum {

  /**
   * Web端 0
   */
  WEB(0, "Web端"),
  /**
   * 接口 1
   */
  API(1, "接口端"),
  /**
   * 移动mweb端 2
   */
  MWEB(2, "Mweb端"),
  /**
   * 微信端 3
   */
  WEIXIN(3, "微信端"),
  /**
   * 手机app端 4
   */
  APP(4, "手机app端"),
  /**
   * 未知
   */
  UNKNOW(5, "未知");

  /**
   * @param code
   * @param description
   */
  private AccessTypeEnum(int code, String description) {
    this.code = code;
    this.description = description;
    EnumUtils.put(this.getClass().getName() + code, this);
  }

  public static boolean isEnum(int code) {
    AccessTypeEnum[] values = AccessTypeEnum.values();
    for (AccessTypeEnum e : values) {
      if (e.getCode() == code) {
        return true;
      }
    }
    return false;
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
  public static AccessTypeEnum codeOf(Integer code) {
    Object obj = EnumUtils.get(AccessTypeEnum.class.getName() + code);
    if (null != obj) {
      return (AccessTypeEnum) obj;
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
