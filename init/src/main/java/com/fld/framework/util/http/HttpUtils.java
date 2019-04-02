package com.fld.framework.util.http;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.time.StopWatch;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import com.fld.framework.constant.IBaseConstant;
import com.fld.framework.entity.Entry;
import com.fld.framework.util.CoreLogUtils;
import com.fld.framework.util.URLCoderUtil;

public class HttpUtils {

	private static final String AJAX_REQUEST_HEADER_NAME = "X-Requested-With";
	private static final String AJAX_REQUEST_HEADER_VALUE = "XMLHttpRequest";
	private static final String AJAX_REQUEST_URI_PREFIX = "ajax-";
	private static final int HTTPCLIENT_TIMEOUT = 180000;

	/**
	 * 若为连接池 isPool设置为true
	 */
	private CloseableHttpClient httpClient;
	/**
	 * httpClient 是否为连接池
	 */
	private boolean isPool = false;

	public HttpUtils(CloseableHttpClient httpClient, boolean isPool) {
		super();
		this.httpClient = httpClient;
		this.isPool = isPool;
	}

	public static boolean isAjax(HttpServletRequest request) {
		String uri = request.getRequestURI();
		uri = uri.substring(uri.lastIndexOf("/") + 1);
		return AJAX_REQUEST_HEADER_VALUE.equals(request.getHeader(AJAX_REQUEST_HEADER_NAME))
				|| uri.startsWith(AJAX_REQUEST_URI_PREFIX);
	}

	public static String getLocalIP() {
		InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}

		byte[] ipAddr = addr.getAddress();
		String ipAddrStr = "";
		for (int i = 0; i < ipAddr.length; i++) {
			if (i > 0) {
				ipAddrStr += ".";
			}
			ipAddrStr += ipAddr[i] & 0xFF;
		}
		return ipAddrStr;
	}

	/**
	 * 
	 * @【方法名称】 post
	 * @【方法描述】 post 发送请求
	 * @【适用条件】 返回数据中为 字符串
	 * @【执行流程】 @【注意事项】 @param sendURL 发送路径 params发送参数 无序 key=value
	 * @return Entry 属性 code=SUCCESS 则 msg=返回字符串
	 * @Exception
	 */
	public static Entry<String, String> post(String sendURL, Map<String, String> params) {
		return post(sendURL, params, IBaseConstant.DEFAULT_CHARSET);
	}

	/**
	 * 
	 * @【方法名称】 post
	 * @【方法描述】 post 发送请求
	 * @【适用条件】 返回数据中为 字符串
	 * @【执行流程】 @【注意事项】 @param sendURL 发送路径 params发送参数 无序 key=value charset
	 *         post请求与返回字符类型
	 * @return ReturnInfoAdapter 属性 returnCode=SUCCESS 则 returnMsg= 返回字符串
	 * @Exception
	 */
	public static Entry<String, String> post(String sendURL, Map<String, String> params, Charset charset) {
		return post(sendURL, params, charset, null);
	}

	/**
	 * 
	 * @Title: postReturnByte @param sendURL @param encoding @param
	 *         contentType @return Entry<String,byte[]> 返回类型
	 */
	public static Entry<String, String> post(String sendURL, Map<String, String> params, Charset encoding,
			String contentType) {
		return post(sendURL, getNameValueList(params), encoding, contentType);
	}

	/**
	 * 
	 * @Title: postReturnByte @param sendURL @param nameValueList @param
	 *         encoding @param contentType @return Entry<String,byte[]> 返回类型
	 */
	public static Entry<String, String> post(String sendURL, List<NameValuePair> nameValueList, Charset encoding,
			String contentType) {
		CloseableHttpClient httpclient = HttpClients.createDefault();
		return post(sendURL, nameValueList, encoding, contentType, httpclient, false);
	}

	public Entry<String, String> poolPost(String sendURL, Map<String, String> params) {
		return poolPost(sendURL, params, null);
	}

	public Entry<String, String> poolPost(String sendURL, Map<String, String> params, Set<String> logParamIgnore) {
		if (!this.isPool) {
			CoreLogUtils.error("HttpUtils poolPost isPool false");
			this.httpClient = HttpClients.createDefault();
		}
		return post(sendURL, getNameValueList(params), logParamIgnore, IBaseConstant.DEFAULT_CHARSET, null,
				this.httpClient, isPool);
	}

	public static Entry<String, String> post(String sendURL, List<NameValuePair> nameValueList, Charset encoding,
			String contentType, CloseableHttpClient httpclient, boolean isPool) {
		return post(sendURL, nameValueList, null, encoding, contentType, httpclient, isPool);
	}

	/**
	 * 
	 * @Title: postReturnByte @param sendURL @param nameValueList @param
	 *         encoding @param contentType @return Entry<String,String> 返回类型
	 */
	public static Entry<String, String> post(String sendURL, List<NameValuePair> nameValueList,
			Set<String> logParamIgnore, Charset encoding, String contentType, CloseableHttpClient httpclient,
			boolean isPool) {

		Entry<String, String> result = new Entry<String, String>(Entry.ERROR, "");

		Long longTime = System.currentTimeMillis();
		result.setExt(longTime);

		StringBuffer reqLog = new StringBuffer("HttpReq:");
		reqLog.append("[time=").append(longTime).append(", reqUrl=").append(sendURL).append(",params=[");
		if (null != logParamIgnore && !logParamIgnore.isEmpty()) {
			if (null != nameValueList) {
				for (NameValuePair nv : nameValueList) {
					reqLog.append(nv.getName()).append("=");
					if (logParamIgnore.contains(nv.getName())) {
						reqLog.append("******");
					} else {
						reqLog.append(nv.getValue());
					}
					reqLog.append(",");
				}
			}
		} else {
			reqLog.append(nameValueList);
		}

		reqLog.append("]]");
		CoreLogUtils.serviceLog(reqLog.toString());

		/** time totals */
		StopWatch watch = new StopWatch();
		watch.start();

		HttpEntity entity = null;
		CloseableHttpResponse response = null;
		HttpPost httpPost = null;

		try {

			httpPost = new HttpPost(sendURL);
			httpPost.setHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-cn");

			RequestConfig config = RequestConfig.custom().setSocketTimeout(HTTPCLIENT_TIMEOUT)
					.setConnectionRequestTimeout(HTTPCLIENT_TIMEOUT).setConnectTimeout(HTTPCLIENT_TIMEOUT).build();
			httpPost.setConfig(config);
			httpPost.setEntity(getUrlEncoded(nameValueList, encoding, contentType));

			response = httpclient.execute(httpPost);
			if (response == null) {
				return result;
			}

			Integer respStatus = response.getStatusLine().getStatusCode();

			try {

				if (HttpStatus.SC_OK == respStatus) {

					result.setCode(Entry.SUCCESS);
					entity = response.getEntity();
					if (entity != null) {
						byte[] byteStr = IOUtils.toByteArray(entity.getContent());
						if (null != byteStr) {
							result.setMsg(new String(byteStr, encoding));
						}

					}
				} else {
					result.put(Entry.ERROR, response.getStatusLine().toString());
				}

			} finally {
				try {
					if (entity != null) {
						IOUtils.closeQuietly(entity.getContent());
						EntityUtils.consume(entity);
					}
					response.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}

		} catch (Exception e) {
			CoreLogUtils.error("send(" + longTime + ")", new Throwable(e));
			// 异常返回
			result.put(Entry.ERROR, e.getMessage());
		} finally {
			if (null != httpPost) {
				httpPost.releaseConnection();
				httpPost = null;
			}
			if (!isPool) {
				try {
					httpclient.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}
		}

		CoreLogUtils.serviceLog("HttpResp: [time=" + longTime + ",totalTime=" + watch.getTime() + ", reqUrl=" + sendURL
				+ ",response=" + result + "]");
		return result;

	}

	/**
	 * 
	 * @Title: get @param sendURL @param params @return Entry
	 *         <String,String> 返回类型
	 */
	public static Entry<String, String> get(String sendURL, Map<String, String> params, Map<String, String> headers) {
		return get(sendURL, params, headers, IBaseConstant.DEFAULT_CHARSET, HttpClients.createDefault(), false);
	}

	/**
	 * 
	 * @Title: get @param sendURL @param params @param encoding @return Entry
	 *         <String,String> 返回类型
	 */
	public static Entry<String, String> get(String sendURL, Map<String, String> params, Map<String, String> headers,
			Charset encoding, CloseableHttpClient httpclient, boolean isPool) {

		Entry<String, String> result = new Entry<String, String>(Entry.ERROR, "");

		if (null == sendURL || sendURL.isEmpty()) {
			result.setMsg("url is " + sendURL);
			return result;
		}

		Long longTime = System.currentTimeMillis();
		result.setExt(longTime);

		StringBuffer reqLog = new StringBuffer("HttpReq:");
		reqLog.append("[time=").append(longTime).append(", reqUrl=").append(sendURL).append(",params=[").append(params)
				.append("]").append("headers=[").append(headers).append("]]");
		CoreLogUtils.serviceLog(reqLog.toString());

		/** time totals */
		StopWatch watch = new StopWatch();
		watch.start();

		HttpEntity entity = null;
		CloseableHttpResponse response = null;
		HttpGet httpGet = null;

		try {
			StringBuffer psb = new StringBuffer();
			if (null != params && !params.isEmpty()) {
				params.forEach((key, value) -> {
					psb.append("&").append(key).append("=")
							.append(URLCoderUtil.encodeUTF8(Objects.toString(value, "")));
				});
			}
			if (!sendURL.contains("?") && psb.length() > 0) {
				psb.replace(0, 1, "?");
			}
			httpGet = new HttpGet(sendURL + psb.toString());
			httpGet.setHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-cn");
			if (null != headers) {
				for (Map.Entry<String, String> e : headers.entrySet()) {
					httpGet.setHeader(e.getKey(), e.getValue());
				}
			}
			RequestConfig config = RequestConfig.custom().setSocketTimeout(HTTPCLIENT_TIMEOUT)
					.setConnectionRequestTimeout(HTTPCLIENT_TIMEOUT).setConnectTimeout(HTTPCLIENT_TIMEOUT).build();
			httpGet.setConfig(config);
			response = httpclient.execute(httpGet);
			if (response == null) {
				return result;
			}

			Integer respStatus = response.getStatusLine().getStatusCode();

			try {

				if (HttpStatus.SC_OK == respStatus) {

					result.setCode(Entry.SUCCESS);
					entity = response.getEntity();
					if (entity != null) {
						byte[] byteStr = IOUtils.toByteArray(entity.getContent());
						if (null != byteStr) {
							result.setMsg(new String(byteStr, encoding));
						}

					}
				} else {
					result.put(Entry.ERROR, response.getStatusLine().toString());
				}

			} finally {
				try {
					if (entity != null) {
						IOUtils.closeQuietly(entity.getContent());
						EntityUtils.consume(entity);
					}
					response.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}

		} catch (Exception e) {
			CoreLogUtils.error("send(" + longTime + ")", new Throwable(e));
			// 异常返回
			result.put(Entry.ERROR, e.getMessage());
		} finally {
			if (null != httpGet) {
				httpGet.releaseConnection();
				httpGet = null;
			}
			if (!isPool) {
				try {
					httpclient.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}
		}

		CoreLogUtils.serviceLog("HttpResp: [time=" + longTime + ",totalTime=" + watch.getTime() + ", reqUrl=" + sendURL
				+ ",response=" + result + "]");
		return result;

	}

	/**
	 * 
	 * @Title: poolPost @Description: @author zhaokuner @param sendURL @param
	 *         httpEntity @param timestamp 日子唯一标准 @return
	 */
	public Entry<String, String> poolPost(String sendURL, HttpEntity paramHe, Long... timestamp) {

		Entry<String, String> result = new Entry<String, String>(Entry.ERROR, "response is null");
		Long longTime = null;
		if (null != timestamp && timestamp.length > 0) {
			longTime = timestamp[0];
		}
		if (null == longTime) {
			longTime = System.currentTimeMillis();
		}
		result.setExt(longTime);

		StringBuffer reqLog = new StringBuffer("HttpReq:");
		reqLog.append("[time=").append(longTime).append(", reqUrl=").append(sendURL);
		reqLog.append("]]");
		CoreLogUtils.serviceLog(reqLog.toString());

		/** time totals */
		StopWatch watch = new StopWatch();
		watch.start();

		HttpEntity entity = null;
		CloseableHttpResponse response = null;
		HttpPost httpPost = null;

		try {

			httpPost = new HttpPost(sendURL);
			httpPost.setHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-cn");

			RequestConfig config = RequestConfig.custom().setSocketTimeout(HTTPCLIENT_TIMEOUT)
					.setConnectionRequestTimeout(HTTPCLIENT_TIMEOUT).setConnectTimeout(HTTPCLIENT_TIMEOUT).build();
			httpPost.setConfig(config);
			httpPost.setEntity(paramHe);
			response = this.httpClient.execute(httpPost);
			if (response == null) {
				return result;
			}

			Integer respStatus = response.getStatusLine().getStatusCode();

			try {

				if (HttpStatus.SC_OK == respStatus) {

					result.setCode(Entry.SUCCESS);
					entity = response.getEntity();
					if (entity != null) {
						byte[] byteStr = IOUtils.toByteArray(entity.getContent());
						if (null != byteStr) {
							result.setMsg(new String(byteStr, StandardCharsets.UTF_8));
						}

					}
				} else {
					result.put(Entry.ERROR, response.getStatusLine().toString());
				}

			} finally {
				try {
					if (entity != null) {
						IOUtils.closeQuietly(entity.getContent());
						EntityUtils.consume(entity);
					}
					response.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}

		} catch (Exception e) {
			CoreLogUtils.error("send(" + longTime + ")", new Throwable(e));
			// 异常返回
			result.put(Entry.ERROR, e.getMessage());
		} finally {
			if (null != httpPost) {
				httpPost.releaseConnection();
				httpPost = null;
			}
			if (!isPool) {
				try {
					this.httpClient.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}
		}

		CoreLogUtils.serviceLog("HttpResp: [time=" + longTime + ",totalTime=" + watch.getTime() + ", reqUrl=" + sendURL
				+ ",response=" + result + "]");
		return result;

	}

	/**
	 * 
	 * @Title: poolPost @Description: @author zhaokuner @param sendURL @param
	 *         Charset 默认为StandardCharsets.UTF_8 @param content 发送内容 @param
	 *         timestamp 日子唯一标准 @return
	 */
	public Entry<String, String> poolPost(String sendURL, String content, Long... timestamp) {

		return poolPost(sendURL, content, StandardCharsets.UTF_8, timestamp);
	}

	/**
	 * 
	 * @Title: poolPost @Description: @author zhaokuner @param sendURL @param
	 *         content 发送内容 @param timestamp 日子唯一标准 @return
	 */
	public Entry<String, String> poolPost(String sendURL, String content, Charset charset, Long... timestamp) {

		Entry<String, String> result = new Entry<String, String>(Entry.ERROR, "response is null");
		Long longTime = null;
		if (null != timestamp && timestamp.length > 0) {
			longTime = timestamp[0];
		}
		if (null == longTime) {
			longTime = System.currentTimeMillis();
		}
		result.setExt(longTime);

		StringBuffer reqLog = new StringBuffer("HttpReq:");
		reqLog.append("[time=").append(longTime).append(", reqUrl=").append(sendURL).append(", content=")
				.append(content);
		reqLog.append("]]");
		CoreLogUtils.serviceLog(reqLog.toString());

		/** time totals */
		StopWatch watch = new StopWatch();
		watch.start();

		HttpEntity entity = null;
		CloseableHttpResponse response = null;
		HttpPost httpPost = null;

		try {

			httpPost = new HttpPost(sendURL);
			httpPost.setHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-cn");

			RequestConfig config = RequestConfig.custom().setSocketTimeout(HTTPCLIENT_TIMEOUT)
					.setConnectionRequestTimeout(HTTPCLIENT_TIMEOUT).setConnectTimeout(HTTPCLIENT_TIMEOUT).build();
			httpPost.setConfig(config);

			httpPost.setEntity(new StringEntity(content, charset));
			response = this.httpClient.execute(httpPost);
			if (response == null) {
				return result;
			}

			Integer respStatus = response.getStatusLine().getStatusCode();

			try {

				if (HttpStatus.SC_OK == respStatus) {

					result.setCode(Entry.SUCCESS);
					entity = response.getEntity();
					if (entity != null) {
						byte[] byteStr = IOUtils.toByteArray(entity.getContent());
						if (null != byteStr) {
							result.setMsg(new String(byteStr, StandardCharsets.UTF_8));
						}

					}
				} else {
					result.put(Entry.ERROR, response.getStatusLine().toString());
				}

			} finally {
				try {
					if (entity != null) {
						IOUtils.closeQuietly(entity.getContent());
						EntityUtils.consume(entity);
					}
					response.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}

		} catch (Exception e) {
			CoreLogUtils.error("send(" + longTime + ")", new Throwable(e));
			// 异常返回
			result.put(Entry.ERROR, e.getMessage());
		} finally {
			if (null != httpPost) {
				httpPost.releaseConnection();
				httpPost = null;
			}
			if (!isPool) {
				try {
					this.httpClient.close();
				} catch (IOException e) {
					CoreLogUtils.error("close(" + longTime + ")", new Throwable(e));
				}
			}
		}

		CoreLogUtils.serviceLog("HttpResp: [time=" + longTime + ",totalTime=" + watch.getTime() + ", reqUrl=" + sendURL
				+ ",response=" + result + "]");
		return result;

	}

	/**
	 * @Title: getNameValueList @param params @return List<NameValuePair> 返回类型
	 */
	public static List<NameValuePair> getNameValueList(Map<String, String> params) {

		List<NameValuePair> result = new ArrayList<NameValuePair>();

		if (null != params && !params.isEmpty()) {

			Set<Map.Entry<String, String>> paramsSet = params.entrySet();

			for (Map.Entry<String, String> entry : paramsSet) {
				result.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			}
		}
		return result;
	}

	/**
	 * 
	 * @Title: GetField @param @param params @param @param
	 *         encoding @param @param contentType @param @return 设定文件 @return
	 *         UrlEncodedFormEntity 返回类型
	 */
	private static UrlEncodedFormEntity getUrlEncoded(List<NameValuePair> nvps, Charset encoding, String contentType) {

		if (nvps == null) {
			nvps = new ArrayList<NameValuePair>();
		}

		UrlEncodedFormEntity result = new UrlEncodedFormEntity(nvps, encoding);
		if (null != contentType && !contentType.isEmpty()) {
			result.setContentType(contentType);
		}
		return result;
	}

	public Entry<String, String> poolGet(String sendURL, Map<String, String> params) {
		return poolGet(sendURL, params, null);
	}

	public Entry<String, String> poolGet(String sendURL, Map<String, String> params, Map<String, String> headers) {
		if (!this.isPool) {
			CoreLogUtils.error("HttpUtils poolPost isPool false");
			this.httpClient = HttpClients.createDefault();
		}
		return get(sendURL, params, headers, IBaseConstant.DEFAULT_CHARSET, this.httpClient, isPool);
	}

	public CloseableHttpClient getHttpClient() {
		return httpClient;
	}

	public void setHttpClient(CloseableHttpClient httpClient) {
		this.httpClient = httpClient;
	}

	public boolean isPool() {
		return isPool;
	}

	public void setPool(boolean isPool) {
		this.isPool = isPool;
	}
}
