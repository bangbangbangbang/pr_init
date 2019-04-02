package com.fld.init.framework.util;import java.util.UUID;import javax.servlet.http.Cookie;import javax.servlet.http.HttpServletResponse;import org.apache.commons.lang3.StringUtils;import org.springframework.web.context.request.RequestContextHolder;import org.springframework.web.context.request.ServletRequestAttributes;import com.fld.framework.util.Des3Util;import com.fld.framework.util.JacksonUtils;import com.fld.init.cache.CookieSecurityKeyUtil;import com.fld.init.framework.constant.Configuration;import com.fld.init.framework.constant.CookieConfig;import com.fld.init.framework.runtime.FullPathHolder;import com.fld.init.model.dto.account.LoginCookie;public class CookieResoleUtils {  public static void removeCookieByName(HttpServletResponse response, String name) {    if (StringUtils.isBlank(name)) {      return;    }    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (name.equals(c.getName())) {          Cookie cookie = new Cookie(c.getName(), null);          cookie.setMaxAge(0);          cookie.setPath("/");          cookie.setDomain(Configuration.SSO_DOMAIN);          response.addCookie(cookie);        }      }    }  }  public static Cookie getCookieByName(String name) {    if (StringUtils.isBlank(name)) {      return null;    }    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (name.equals(c.getName())) {          return c;        }      }    }    return null;  }  public static <F> F getCookieByName(String name, Class<F> clazz) {    if (null == name) {      return null;    }    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (name.equals(c.getName())) {          String value = c.getValue();          if (StringUtils.isBlank(value)) {            return null;          }          return JacksonUtils.readValue(value, clazz);        }      }    }    return null;  }  public static String getVcodeKey() {    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (CookieConfig._VCODE_.equals(c.getName())) {          return c.getValue();        }      }    }    return null;  }  public static String getCookieSessionId() {    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (CookieConfig._JSESSIONID_.equals(c.getName())) {          LogUtils.serviceDebugLog("get sessionId cookie " + c.getValue());          return c.getValue();        }      }    }    String sessionId = UUID.randomUUID().toString().replaceAll("-", "");    addCookieSessionId(FullPathHolder.getHttpServletResponse(), sessionId);    return sessionId;  }  public static Cookie addCookieSessionId(HttpServletResponse response, String sessionId) {    Cookie cookie = new Cookie(CookieConfig._JSESSIONID_, sessionId);    cookie.setMaxAge(-1);    cookie.setPath("/");    cookie.setDomain(Configuration.SSO_DOMAIN);    response.addCookie(cookie);    LogUtils.serviceLog("add sessionId cookie " + sessionId);    return cookie;  }  public static void removeSessionIdCookie(HttpServletResponse response) {    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (CookieConfig._JSESSIONID_.equals(c.getName())) {          Cookie cookie = new Cookie(c.getName(), null);          cookie.setMaxAge(0);          cookie.setPath("/");          cookie.setDomain(Configuration.SSO_DOMAIN);          response.addCookie(cookie);          LogUtils.serviceLog("remove sessionId cookie " + c.getName());        }      }    }  }  public static void removeLoginCookie(HttpServletResponse response) {    Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())        .getRequest().getCookies();    if (list != null && list.length > 0) {      for (Cookie c : list) {        if (CookieConfig._HAOHAN_.equals(c.getName())) {          Cookie cookie = new Cookie(c.getName(), null);          cookie.setMaxAge(0);          cookie.setPath("/");          cookie.setDomain(Configuration.SSO_DOMAIN);          response.addCookie(cookie);          LogUtils.serviceLog("remove cookie " + c.getName());        }      }    }  }  /**   * 写入登录信息到cookie， 写入的登录信息主要作为登录依据,为单点登录服务   *    * @param response   * @param loginCookie   */  public static void addCookieWithEncrypt(HttpServletResponse response, Object obj, String name,      int maxAge) {    try {      String jsons = JacksonUtils.toJson(obj);      jsons = Des3Util.encryptWithURLEncoder(jsons,          CookieSecurityKeyUtil.getCookieSecurityKey().getSecurityKey());      Cookie cookie = new Cookie(name, jsons);      cookie.setMaxAge(maxAge);      cookie.setDomain(Configuration.SSO_DOMAIN);      cookie.setPath("/");      response.addCookie(cookie);      LogUtils.serviceLog("加密cookie[name]" + name + "[json]" + jsons);    } catch (Exception e) {      LogUtils.error("login generate Cookie error ", e);    }  }  public static <F> F getCookieWithDecrypt(String name, Class<F> clazz) {    if (StringUtils.isBlank(name)) {      return null;    }    F t = null;    try {      String value = "";      Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())          .getRequest().getCookies();      if (list != null && list.length > 0) {        for (Cookie c : list) {          if (name.equals(c.getName())) {            value = c.getValue();            if (StringUtils.isNotBlank(value)) {              value = Des3Util.decryptWithURLDecoder(value,                  CookieSecurityKeyUtil.getCookieSecurityKey().getSecurityKey());              if (StringUtils.isBlank(value)) {                CookieSecurityKeyUtil.initCookieSecurityKey();                value = Des3Util.decryptWithURLDecoder(value,                    CookieSecurityKeyUtil.getCookieSecurityKey().getSecurityKey());              }              if (!StringUtils.isBlank(value)) {                t = JacksonUtils.readValue(value, clazz);              }            }            break;          }        }      }    } catch (Exception e) {      LogUtils.error(" analysis cookie " + name + " error ", e);    }    return t;  }  /**   * 写入登录信息到cookie， 写入的登录信息主要作为登录依据,为单点登录服务   *    * @param response   * @param loginCookie   */  public static void generateCookieByLoginCookie(HttpServletResponse response,      LoginCookie loginCookie) {    try {      String jsons = JacksonUtils.toJson(loginCookie);      jsons = Des3Util.encryptWithURLEncoder(jsons,          CookieSecurityKeyUtil.getCookieSecurityKey().getSecurityKey());      LogUtils.serviceDebugLog("加密cookie[json]" + jsons);      Cookie cookie = new Cookie(CookieConfig._HAOHAN_, jsons);      cookie.setMaxAge(loginCookie.getCookieScopeTime());      cookie.setDomain(Configuration.SSO_DOMAIN);      cookie.setPath("/");      response.addCookie(cookie);      LogUtils.serviceLog("add cookie " + CookieConfig._HAOHAN_);    } catch (Exception e) {      LogUtils.error("login generate Cookie error ", e);    }  }  public static LoginCookie getLoginCookieByCookieFn() {    LoginCookie loginCookie = null;    try {      String loginValues = "";      Cookie[] list = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())          .getRequest().getCookies();      if (list != null && list.length > 0) {        for (Cookie c : list) {          if (CookieConfig._HAOHAN_.equals(c.getName())) {            loginValues = c.getValue();            if (StringUtils.isNotBlank(loginValues)) {              loginValues = Des3Util.decryptWithURLDecoder(loginValues,                  CookieSecurityKeyUtil.getCookieSecurityKey().getSecurityKey());              if (StringUtils.isBlank(loginValues)) {                CookieSecurityKeyUtil.initCookieSecurityKey();                loginValues = Des3Util.decryptWithURLDecoder(loginValues,                    CookieSecurityKeyUtil.getCookieSecurityKey().getSecurityKey());              }              if (!StringUtils.isBlank(loginValues)) {                loginCookie = JacksonUtils.readValue(loginValues, LoginCookie.class);              }            }            break;          }        }      }    } catch (Exception e) {      LogUtils.error(" analysis login Cookie error ", e);    }    return loginCookie;  }  /**   * 设置cookie   *    * @param response   * @param name cookie名字   * @param value cookie值   * @param maxAge cookie生命周期 以秒为单位   */  public static void addCookie(HttpServletResponse response, String name, String value,      int maxAge) {    Cookie cookie = new Cookie(name, value);    cookie.setPath("/");    cookie.setDomain(Configuration.SSO_DOMAIN);    cookie.setComment(System.currentTimeMillis() + "");    if (maxAge > 0) {      cookie.setMaxAge(maxAge);    }    response.addCookie(cookie);  }}