<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%><c:set var="baseStaticUrl" scope="request"  value="<%=com.sevenchildren.yzmm.framework.constant.Configuration.STATIC_RESOURSE_HTTP_URL%>"></c:set><c:set var="version" scope="request" value="2.3.59"></c:set><%@taglib prefix="b" uri="/baseStaticUrl" %><b:staticUrl init="true" baseUrl="${baseStaticUrl}" version="${version}"/>
<%	response.setHeader("Cache-Control","no-cache"); //HTTP 1.1response.setHeader("Pragma","no-cache"); //HTTP 1.0response.setDateHeader ("Expires", 0); //prevents caching at the proxy server%>
