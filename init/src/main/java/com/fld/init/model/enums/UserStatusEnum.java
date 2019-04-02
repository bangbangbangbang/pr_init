package com.fld.init.model.enums;

import com.fld.framework.enums.SuperEnum;
import com.fld.framework.util.EnumUtils;

/**
 * 通行证状态
 * 
 * @author zhaokuner
 *
 */
public enum UserStatusEnum implements SuperEnum {
  /**
   * 已付款 对完善信息无要求
   */
  PAY(5, "已付款"),
  /**
   * 会员过期
   */
  VIP_OVERDUE(4, "会员过期"),
  /**
   * 小白用户
   */
  BEGINNER(3, "小白"),
  /**
   * 待审核 强制完善信息
   */
  AUDIT(2, "待审核"),
  /**
   * 激活
   */
  ACTIVED(1, "激活"),
  /**
   * 冻结
   */
  FREEZED(0, "冻结");

  /**
   * 构造函数
   * 
   * @param code 编码
   * @param description 说明
   */
  private UserStatusEnum(int code, String description) {
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
  public static UserStatusEnum codeOf(Integer code) {
    if (code != null) {
      Object obj = EnumUtils.get(UserStatusEnum.class.getName() + code);
      if (null != obj) {
        return (UserStatusEnum) obj;
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
