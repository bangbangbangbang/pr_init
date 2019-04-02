package com.fld.init.framework.constant;

import org.springframework.stereotype.Component;

/**
 * 
 * @ClassName: CookieConfig
 * @Description:cookie相关
 * @author
 * @date 2017年4月18日 下午4:18:22
 *
 */
@Component
public class CookieConfig {
  /**
   * cookie会话数据key
   */
  public static String _HAOHAN_ = "";
  /**
   * cookie会话ID
   */
  public static String _JSESSIONID_ = "";
  /**
   * cookie验证码
   */
  public static String _VCODE_ = "";

  /**
   * 进流程页面的referer，流程后跳转
   */
  public static String CALLBACK_REFERER = "callbackReferer";

  /**
   * 注册时推荐人信息
   */
  public static String REG_REFERER = "regReferrer";

}
