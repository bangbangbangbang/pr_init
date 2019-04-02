package com.fld.init.ctrl.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import com.fld.framework.enums.AccessTypeEnum;
import com.fld.framework.exception.ActionException;
import com.fld.framework.exception.MwebException;
import com.fld.framework.exception.SystemException;
import com.fld.framework.exception.WebException;
import com.fld.framework.util.JacksonUtils;
import com.fld.framework.util.http.HttpUtils;
import com.fld.init.framework.runtime.ApiHolder;
import com.fld.init.framework.runtime.FullPathHolder;
import com.fld.init.framework.runtime.SessionHolder;
import com.fld.init.framework.util.CookieResoleUtils;
import com.fld.init.framework.util.LogUtils;
import com.fld.init.model.dto.account.LoginCookie;
import com.fld.init.model.status.YzmmResultStatus;

public class ExceptionHandler implements HandlerExceptionResolver {

  @Override
  public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response,
      Object object, Exception exception) {

    ActionException e = null;

    request.setAttribute("requestId", FullPathHolder.getRequestId());

    switch (exception.getClass().getSimpleName()) {
      case "ActionException":
        // 处理超时
        if (YzmmResultStatus.SESSION_TIME_OUT.getCode() == ((ActionException) exception)
            .getExceptionResp().getCode()) {
          e = (ActionException) exception;
          // 记录为业务返回日志
          LogUtils.serviceLog("[SESSION_TIME_OUT]异常" + "[info]" + e.toJson());
          CookieResoleUtils.removeLoginCookie(response);
          if (dealWriteAjax(request, response, exception)) {
            return null;
          }
          String serviceType = FullPathHolder.getHeader().getServiceType();
          if (NumberUtils.isNumber(serviceType)
              && AccessTypeEnum.WEB.getCode() != (Integer.parseInt(serviceType))) {
            return new ModelAndView("error/mweb");
          }
          return new ModelAndView("redirect:/");
        }
      case "ApiException":
        // api处理，所有返回都为json
        e = (ActionException) exception;
        // 记录为业务返回日志
        LogUtils.serviceApiLog(
            "[ApiException]" + "[info]" + e.toJson() + "[ApiHolder]" + ApiHolder.get());
        return dealError(e, request, response);
      case "WebException":
        // web请求返回，区别同步异步
        LogUtils.serviceLog("[WEB]异常[url]" + request.getRequestURL().toString() + "[info]"
            + ((WebException) exception).toJson());
        if (dealWriteAjax(request, response, exception)) {
          return null;
        }
        return new ModelAndView("error/web");

      case "MwebException":
        // mweb请求返回，区别同步异步
        LogUtils.serviceLog("[MWEB]异常[url]" + request.getRequestURL().toString() + "[info]"
            + ((MwebException) exception).toJson());
        if (dealWriteAjax(request, response, exception)) {
          return null;
        }
        return new ModelAndView("error/mweb");
      case "MaxUploadSizeExceededException":
        // 文件超过最大进行拦截
        respWriter(response, JacksonUtils.toJson(YzmmResultStatus.TEST));
        return null;
      default:
        String reqParams = StringUtils.defaultString(request.getQueryString());// 请求参数

        if ("POST".equals(request.getMethod())) {
          reqParams = JacksonUtils.toJson(request.getParameterMap());
          if (StringUtils.isNotBlank(reqParams)) {
            reqParams = reqParams.replace("[", "").replace("]", "");
          }
        }
        String uid = "";
        LoginCookie lc = SessionHolder.getLoginCookie();
        if (null != lc) {
          uid = StringUtils.defaultString(lc.getUid());
        }
        // 其它错误记录日志
        LogUtils.error("[其它]异常[url]" + request.getRequestURL().toString() + "[queryString]"
            + reqParams + "[uid]" + uid + "[info]" + exception.toString(), exception);
        e = new SystemException(YzmmResultStatus.ERROR);
        return dealError(e, request, response);
    }
  }

  private ModelAndView dealError(ActionException e, HttpServletRequest request,
      HttpServletResponse response) {
    // 处理 AJAX
    boolean isAjax = HttpUtils.isAjax(request);
    if (isAjax) {
      respWriter(response, e.toJson());
    } else {
      request.setAttribute("exceptionResp", e.getExceptionResp());
    }
    // if(null != FullPathHolder.getHeader() &&
    // NumberUtils.isNumber(FullPathHolder.getHeader().getServiceType())
    // && AccessTypeEnum.WEB.getCode() ==
    // Integer.parseInt(FullPathHolder.getHeader().getServiceType())){
    // return new ModelAndView("error/web");
    // }else{
    // return new ModelAndView("error/mweb");
    // }
    return new ModelAndView("error/mweb");
  }

  /**
   * 
   * @Description:处理ajax请求
   * @Date: 2014年6月18日 上午10:52:31
   * @author zhaoxikun
   * @param request
   * @param response
   * @param exception
   * @return
   * @return boolean
   * @throws null
   */
  private boolean dealWriteAjax(HttpServletRequest request, HttpServletResponse response,
      Exception exception) {
    ActionException e = (ActionException) exception;
    // 此为可控制异常，记录日志
    LogUtils.serviceLog(e.toJson());
    request.setAttribute("exceptionResp", e.getExceptionResp());
    request.setAttribute("serviceType", FullPathHolder.getHeader().getServiceType());
    boolean isAjax = HttpUtils.isAjax(request) || e.isAjax();
    if (isAjax) {
      respWriter(response, e.toJson());
    }
    return isAjax;
  }

  /**
   * 
   * @Description:写数据流到response
   * @Date: 2014年6月18日 上午10:51:40
   * @author zhaoxikun
   * @param response
   * @param str
   * @return void
   * @throws null
   */
  private void respWriter(HttpServletResponse response, String str) {
    try {
      response.setContentType("application/json;charset=UTF-8");
      PrintWriter pw = response.getWriter();
      pw.println(str);
      pw.flush();
      pw.close();
    } catch (IOException ex) {
      LogUtils.error(ex.getMessage());
    }
  }

}
