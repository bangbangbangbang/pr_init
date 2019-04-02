package com.fld.init.framework.util;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;

import javax.net.ssl.SSLContext;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHeaders;
import org.apache.http.HttpStatus;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;
import com.fld.framework.entity.BiStringEntry;
import com.fld.framework.entity.Entry;

public class HttpSSLUtil {
	private static final int HTTPCLIENT_TIMEOUT = 180000;

	public int maxTotal = 20;
	public int defaultMaxPerRoute = 10;
	public String certFilePath = "";
	public String keyStoreType = "";
	public String password = "";
	public String supportedProtocols = "";

	private CloseableHttpClient httpClient;
	private SSLConnectionSocketFactory sslsf;

	public SSLConnectionSocketFactory getFactory() throws Exception {

		if (null != sslsf) {
			return sslsf;
		}
		KeyStore keyStore = KeyStore.getInstance(keyStoreType);
		try (FileInputStream instream = new FileInputStream(new File(certFilePath))) {
			keyStore.load(instream, password.toCharArray());
		}

		// Trust own CA and all self-signed certs
		SSLContext sslcontext = SSLContexts.custom().loadKeyMaterial(keyStore, password.toCharArray()).build();
		// Allow TLSv1 protocol only
		sslsf = new SSLConnectionSocketFactory(sslcontext, supportedProtocols.split(","), null, SSLConnectionSocketFactory.getDefaultHostnameVerifier());

		return sslsf;
	}

	private PoolingHttpClientConnectionManager getPHCCM() throws Exception {
		Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory>create().register("https", getFactory()).build();
		PoolingHttpClientConnectionManager pcm = new PoolingHttpClientConnectionManager(socketFactoryRegistry);
		pcm.setMaxTotal(maxTotal);
		pcm.setDefaultMaxPerRoute(defaultMaxPerRoute);
		return pcm;
	}

	private HttpClientBuilder httpClientBuilder() throws Exception {
		HttpClientBuilder hcb = HttpClientBuilder.create();
		hcb.setConnectionManager(getPHCCM());
		return hcb;
	}

	public CloseableHttpClient getHttpClient() throws Exception {
		if (null != httpClient) {
			return httpClient;
		}
		httpClient = httpClientBuilder().build();
		return httpClient;
	}

	public BiStringEntry poolPost(String url, String content) {
		try {
			return defaultPost(url, content, getHttpClient(), true);
		} catch (Exception e) {
			return new BiStringEntry(BiStringEntry.ERROR, e.getMessage());
		}

	}

	public BiStringEntry post(String url, String content) {
		try (CloseableHttpClient httpclient = HttpClients.custom().setSSLSocketFactory(getFactory()).build();) {
			return defaultPost(url, content, httpclient, false);
		} catch (Exception e) {
			return new BiStringEntry(BiStringEntry.ERROR, e.getMessage());
		}
	}

	private BiStringEntry defaultPost(String url, String content, CloseableHttpClient httpclient, boolean isPool) {
		return defaultPost(url, new StringEntity(content, "UTF-8"), httpclient, isPool);
	}

	private BiStringEntry defaultPost(String url, HttpEntity httpEntity, CloseableHttpClient httpclient, boolean isPool) {
		BiStringEntry be = new BiStringEntry(BiStringEntry.ERROR, "");

		try {
			HttpPost httpPost = new HttpPost(url);
			try {
				httpPost.setHeader(HttpHeaders.ACCEPT_LANGUAGE, "zh-cn");

				RequestConfig config = RequestConfig.custom().setSocketTimeout(HTTPCLIENT_TIMEOUT).setConnectionRequestTimeout(HTTPCLIENT_TIMEOUT).setConnectTimeout(HTTPCLIENT_TIMEOUT).build();
				httpPost.setConfig(config);
				httpPost.setEntity(httpEntity);

				try (CloseableHttpResponse response = httpclient.execute(httpPost);) {
					if (response == null) {
						return be;
					}
					Integer respStatus = response.getStatusLine().getStatusCode();
					HttpEntity entity = null;
					try {
						if (HttpStatus.SC_OK == respStatus) {
							be.setCode(Entry.SUCCESS);
							entity = response.getEntity();
							if (entity != null) {
								byte[] byteStr = IOUtils.toByteArray(entity.getContent());
								if (null != byteStr) {
									be.setMsg(new String(byteStr, StandardCharsets.UTF_8));
								}
							}
						} else {
							be.put(Entry.ERROR, response.getStatusLine().toString());
						}

					} finally {
						if (entity != null) {
							IOUtils.closeQuietly(entity.getContent());
							EntityUtils.consume(entity);
						}
					}
					EntityUtils.consume(entity);
				}
			} finally {
				if (null != httpPost) {
					httpPost.releaseConnection();
					httpPost = null;
				}
				if (!isPool) {
					httpclient.close();
				}
			}

		} catch (Exception e) {
			be.put(BiStringEntry.ERROR, e.getMessage());
		}

		return be;
	}

	public int getMaxTotal() {
		return maxTotal;
	}

	public void setMaxTotal(int maxTotal) {
		this.maxTotal = maxTotal;
	}

	public int getDefaultMaxPerRoute() {
		return defaultMaxPerRoute;
	}

	public void setDefaultMaxPerRoute(int defaultMaxPerRoute) {
		this.defaultMaxPerRoute = defaultMaxPerRoute;
	}

	public String getKeyStoreType() {
		return keyStoreType;
	}

	public void setKeyStoreType(String keyStoreType) {
		this.keyStoreType = keyStoreType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSupportedProtocols() {
		return supportedProtocols;
	}

	public void setSupportedProtocols(String supportedProtocols) {
		this.supportedProtocols = supportedProtocols;
	}

	public String getCertFilePath() {
		return certFilePath;
	}

	public void setCertFilePath(String certFilePath) {
		this.certFilePath = certFilePath;
	}

}
