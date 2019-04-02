/**
*
*/
package com.fld.init.model.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * @Title OnlineManageLogoutReasonEnum.java
 * @Copyright 2014 (c)
 * @Description: 退出原因 0：正常玩家退出；1：玩家再次登录；2：超时自动清理 <br>
 * @Created on 2014年5月18日 下午1:16:34
 * @author
 * @version 1.0
 */
public enum OnlineManageLogoutReasonEnum implements SuperEnum {
  /**
   * 正常退出
   */
  LOGOUT(0, "正常退出"),
  /**
   * 挤掉
   */
  SQUEEZED_OUT(1, "挤掉"),
  /**
   * 超时
   */
  TIME_OUT(2, "超时"),
  /**
   * 修改密码
   */
  MODIFY_PWD(3, "修改密码"),
  /**
   * 修改状态
   */
  MODIFY_STATUS(4, "修改状态"),

  /**
   * 超出系统最多会话数被清除
   */
  OVERTOP_LIMIT(5, "超出系统最多会话数"),
  /**
   * 解绑手机-清除sid
   */
  UNBIND_TEL(6, "解绑手机清除SID"),
  /**
   * 解绑邮箱
   */
  UNBIND_EMAIL(7, "解绑邮箱"),
  /**
   * 后台清除手机号
   */
  CLEAN_TEL(8, "后台清除手机号"),
  /**
   * 清除邮箱
   */
  CLEAN_EMAIL(9, "清除邮箱"),
  /**
   * 清除用户登录状态
   */
  CLEAN_UID(10, "清除用户登录状态");

  /**
   * @param code
   * @param description
   */
  private OnlineManageLogoutReasonEnum(int code, String description) {
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
  public static OnlineManageLogoutReasonEnum codeOf(Integer code) {
    Object obj = EnumUtils.get(OnlineManageLogoutReasonEnum.class.getName() + code);
    if (null != obj) {
      return (OnlineManageLogoutReasonEnum) obj;
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
