/**
*
*/
package com.fld.init.model.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * LOGIN_NAME：用户名；TELEPHONE：手机号；EMAIL：邮箱 QQ：QQ；SINAWEIBO：新浪微博； WEIXIN：微信; OTHER:其他 <br>
 * 来源 0：login_name；1：telephone；2：email 3：QQ；4：sinaweibo； 5：weixin ； 6：other
 */
public enum AccountOriginEnum implements SuperEnum {

  /**
   * 用户名 0
   */
  LOGIN_NAME(0, "用户名"),
  /**
   * 手机号 1
   */
  TELEPHONE(1, "手机号"),
  /**
   * 邮箱 2
   */
  EMAIL(2, "邮箱"),
  /**
   * QQ 3
   */
  QQ(3, "qq"),
  /**
   * 新浪微博 4
   */
  SINAWEIBO(4, "新浪微博"),
  /**
   * 微信 5
   */
  WEIXIN(5, "微信"),
  /**
   * 其它
   */
  OTHER(6, "其它");

  /**
   * @param code
   * @param description
   */
  private AccountOriginEnum(int code, String description) {
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
  public static AccountOriginEnum codeOf(Integer code) {
    Object obj = EnumUtils.get(AccountOriginEnum.class.getName() + code);
    if (null != obj) {
      return (AccountOriginEnum) obj;
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
