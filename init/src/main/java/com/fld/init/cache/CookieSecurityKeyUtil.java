package com.fld.init.cache;

import com.fld.framework.util.DateUtils;
import com.fld.init.framework.runtime.ApplicationContextHolder;
import com.fld.init.framework.util.LogUtils;
import com.fld.init.model.dto.account.CookieSecurityKey;

/**
 * cookie 数据加密key 获取工具类
 * 
 * @author
 *
 */
public class CookieSecurityKeyUtil {

  private static CookieSecurityKey entry = null;

  /**
   * 
   * @return Entry.code CookieSecurityKey Entry.msg 剩余有效时间（秒）
   */
  public static CookieSecurityKey getCookieSecurityKey() {
    if (null == entry) {
      return genCookieSecurityKey();
    } else {
      // 过期
      if (entry.getScopeTime() < DateUtils.getUnixTime() - entry.getCreateTime()) {
        return genCookieSecurityKey();
      }
    }
    return entry;
  }

  public static void initCookieSecurityKey() {
    genCookieSecurityKey();
  }

  private static CookieSecurityKey genCookieSecurityKey() {
    LogUtils.serviceLog("CookieSecurityKey[获取]");
    CookieSecurityKey result =
        ApplicationContextHolder.getBean(CookieSecurityKeyCache.class).getCookieSecurityKey();
    LogUtils.serviceLog("CookieSecurityKey[获取]" + result);
    entry = result;
    return entry;
  }

}
