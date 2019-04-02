package com.fld.init.cache;

import org.springframework.stereotype.Component;
import com.fld.framework.util.DateUtils;
import com.fld.framework.util.GenerateUtil;
import com.fld.init.framework.constant.Configuration;
import com.fld.init.model.dto.account.CookieSecurityKey;

@Component
public class CookieSecurityKeyCache {

  public static final String REDIS_KEY = "Cookie:CookieSecurityKey";

  public static final Integer REDIS_KEY_EXPRIE = Configuration.ONE_MONTH_SECOND * 12;

  // @Resource(name = "passportCache")
  private RedisCachedManager cache;

  /**
   * 获取登录Cookie加解密秘钥
   * 
   * @return
   */
  public CookieSecurityKey getCookieSecurityKey() {
    CookieSecurityKey entry = null;

    entry = cache.get(REDIS_KEY, CookieSecurityKey.class);

    if (null == entry) {
      return genCookieSecurityKey();
    }
    return entry;
  }

  private CookieSecurityKey genCookieSecurityKey() {

    CookieSecurityKey entry = new CookieSecurityKey();
    String cookieSecurityKey = GenerateUtil.getRandomStr(24);
    entry.setSecurityKey(cookieSecurityKey);
    entry.setScopeTime(REDIS_KEY_EXPRIE);
    entry.setCreateTime(DateUtils.getUnixTime());

    boolean hasSave = cache.setNX(REDIS_KEY, REDIS_KEY_EXPRIE, entry);
    if (!hasSave) {
      entry = cache.get(REDIS_KEY, CookieSecurityKey.class);
    }
    return entry;
  }

}
