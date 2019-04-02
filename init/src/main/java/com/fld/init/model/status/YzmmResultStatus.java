package com.fld.init.model.status;

import com.fld.framework.constant.RespStatus;
import com.fld.framework.constant.RespStatusUtil;
import com.fld.framework.entity.BaseStatus;

/**
 * 用户平台 业务码
 * 
 * @author zhaokuner
 *
 */
public class YzmmResultStatus extends RespStatus {

  /** 公共参数校验码 (2位服务编号 + 5位错误码)01 00001起 */
  private static final long serialVersionUID = 5240810677704674735L;
  /** 接口参数 101### **/
  /** 101001, "参数账号不存在" */
  public static final BaseStatus TEST = new BaseStatus(101000, "异常测试");

  /** 101001, "参数账号不存在" */
  public static final BaseStatus PARAMS_ACCOUNT_NOT_EXIST = new BaseStatus(101001, "参数账号不存在");
  /** 101002, "参数密码不存在" */
  public static final BaseStatus PARAMS_PASSWORD_NOT_EXIST = new BaseStatus(101002, "参数密码不存在");
  /** 登录相关 100### **/
  /** 100001, "账号不存在" */
  public static final BaseStatus ACCOUNT_NOT_EXIST = new BaseStatus(100001, "账号不存在");
  /** 100002, "账号已存在" */
  public static final BaseStatus ACCOUNT_EXIST = new BaseStatus(100002, "账号已存在");
  /** 100003, "密码不正确" */
  public static final BaseStatus PASSWORD_INCORRECT = new BaseStatus(100003, "密码不正确");
  /** 100004, "登录账号不存在" */
  public static final BaseStatus PASSPORT_NOT_EXIST = new BaseStatus(100004, "登录账号不存在");
  /** 100005, "无法保存在线信息" */
  public static final BaseStatus ONLINE_SAVE_FAILURE = new BaseStatus(100005, "无法保存在线信息");
  /** 100006, "登录过于频繁" */
  public static final BaseStatus LOGIN_COUNT_OVRETOP = new BaseStatus(100006, "登录过于频繁");

  public static BaseStatus valueOf(Integer code) {
    return RespStatusUtil.valueOf(code, YzmmResultStatus.class);
  }
}
