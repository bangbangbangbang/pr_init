/**
 *
 */
package com.fld.init.framework.runtime;

import org.apache.commons.lang3.StringUtils;
import com.fld.framework.util.JacksonUtils;
import com.fld.init.cache.CommCacheUtil;
import com.fld.init.framework.constant.Configuration;
import com.fld.init.framework.util.CookieResoleUtils;
import com.fld.init.framework.util.LogUtils;
import com.fld.init.model.dto.account.LoginCookie;

public class SessionHolder {

  private static ThreadLocal<SessionObject> threadLocal = new ThreadLocal<SessionObject>() {
    @Override
    protected SessionObject initialValue() {
      return new SessionObject();
    }
  };

  public static void setLoginCookie(LoginCookie loginCookie) {
    if (null == loginCookie) {
      return;
    }
    SessionObject sessionObject = threadLocal.get();
    sessionObject.setLoginCookie(loginCookie);
    threadLocal.set(sessionObject);
  }

  public static String getUid() {
    LoginCookie lc = getLoginCookie();
    if (null != lc) {
      return lc.getUid();
    }
    return null;
  }

  public static String getLa() {
    LoginCookie lc = getLoginCookie();
    if (null != lc) {
      return lc.getLoginAccount();
    }
    return null;
  }

  public static LoginCookie getLoginCookie() {
    SessionObject so = threadLocal.get();
    LoginCookie lc = null;
    if (so != null) {
      lc = so.getLoginCookie();
    }
    if (null == lc) {
      lc = CookieResoleUtils.getLoginCookieByCookieFn();
      if (null != lc) {
        setLoginCookie(lc);
      }
    }
    return lc;
  }

  public static void removeLoginCookie() {
    SessionObject so = threadLocal.get();
    if (so != null) {
      so.setLoginCookie(null);
    }
  }

  public static void cleanLocal() {
    threadLocal.remove();
  }

  public static String getCookieSessionId() {
    SessionObject so = threadLocal.get();
    if (so != null) {
      return so.getCookieSessionId();
    }
    return null;
  }

  public static void setCookieSessionId(String cookieSessionId) {
    SessionObject so = threadLocal.get();
    if (so != null) {
      so.setCookieSessionId(cookieSessionId);
    }
  }

  public static class SessionObject {

    private String cookieSessionId;

    private LoginCookie loginCookie;

    public LoginCookie getLoginCookie() {
      return loginCookie;
    }

    public void setLoginCookie(LoginCookie loginCookie) {
      this.loginCookie = loginCookie;
    }

    public String getCookieSessionId() {
      return cookieSessionId;
    }

    public void setCookieSessionId(String cookieSessionId) {
      this.cookieSessionId = cookieSessionId;
    }

  }

  public static String obtainCookieSessionId() {
    if (StringUtils.isNotBlank(SessionHolder.getCookieSessionId())) {
      return SessionHolder.getCookieSessionId();
    }
    return CookieResoleUtils.getCookieSessionId();
  }

  public static void cleanSession(String hashKey) {
    String sessionId = obtainCookieSessionId();
    if (StringUtils.isNotBlank(sessionId)) {
      CommCacheUtil.removeHash(Configuration.PROJECT_SHORT_NAME + ":session:" + sessionId, hashKey);
    }

  }

  public static void cleanSessionAll() {
    String sessionId = obtainCookieSessionId();
    if (StringUtils.isNotBlank(sessionId)) {
      CommCacheUtil.remove(Configuration.PROJECT_SHORT_NAME + ":session:" + sessionId);
    }

  }

  public static <T> T get(String key, Class<T> clazz) {
    if (StringUtils.isBlank(key) || null == clazz) {
      LogUtils.serviceDebugLog(
          "sessionHolder get session params failure [key]" + key + "[clazz]" + clazz);
      return null;
    }
    String sessionId = obtainCookieSessionId();
    if (StringUtils.isNotBlank(sessionId)) {
      String os =
          CommCacheUtil.getHash(Configuration.PROJECT_SHORT_NAME + ":session:" + sessionId, key);
      if (StringUtils.isNotBlank(os)) {
        return JacksonUtils.readValue(os, clazz);
      }
    }
    LogUtils.serviceDebugLog("sessionHolder get " + Configuration.PROJECT_SHORT_NAME + ":session:"
        + sessionId + "[key]" + key);
    return null;
  }
}
