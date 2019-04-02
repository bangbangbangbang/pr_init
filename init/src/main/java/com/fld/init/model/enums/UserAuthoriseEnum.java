package com.fld.init.model.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * 用户身份信息,用户权限识别
 * 
 * @author yifan
 *
 */
public enum UserAuthoriseEnum implements SuperEnum {
  /**
   * 0 无任何用户信息
   */
  NOTALL(0, "无信息"),
  /**
   * 1 登陆，有账号但未填写任何信息
   */
  LOGIN(1, "登陆"),
  /**
   * 2 已经完成手机认证
   */
  CELLPHONE(2, "手机号完整"),
  /**
   * 3 已经填写完成个人基本信息
   */
  SELFINFO(3, "个人信息完整");

  /**
   * 构造函数
   * 
   * @param code 编码
   * @param description 说明
   */
  private UserAuthoriseEnum(int code, String description) {
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
  public static UserAuthoriseEnum codeOf(Integer code) {
    if (code != null) {
      Object obj = EnumUtils.get(UserAuthoriseEnum.class.getName() + code);
      if (null != obj) {
        return (UserAuthoriseEnum) obj;
      }
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
