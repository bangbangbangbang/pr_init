package com.fld.framework.util.http;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;

import org.apache.commons.lang3.time.StopWatch;
import org.apache.log4j.Logger;

public class HttpPoster {

	private static final Logger log = Logger.getLogger(HttpPoster.class);

	public static String get(String strURL) {
		return get(strURL, "application/x-www-form-urlencoded", "UTF-8", true, null);
	}

	public static String get(String strURL, Map<String, String> headers) {
		return get(strURL, "application/x-www-form-urlencoded", "UTF-8", true, headers);
	}

	private static String get(String strURL, String contentType, String encode, boolean response, Map<String, String> headers) {

		StopWatch watch = new StopWatch();
		watch.start();

		String result = null;
		BufferedOutputStream out = null;
		BufferedInputStream in = null;

		try {

			URL url = new URL(strURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Content-Type", contentType);
			con.setRequestProperty("Comp-Control", "dsmp/sms-mt");
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setConnectTimeout(30000);
			con.setReadTimeout(30000);

			if (headers != null && headers.size() > 0) {
				Set<String> keys = headers.keySet();
				Iterator<String> ir = keys.iterator();
				while (ir.hasNext()) {
					String key = ir.next();
					con.setRequestProperty(key, headers.get(key));
				}
			}

			if (response) {
				in = new BufferedInputStream(con.getInputStream());
				result = readByteStream(in, encode);
			} else {
				con.getInputStream();
			}
		} catch (Exception ex) {
			log.error(ex.getMessage(), new Throwable(ex));
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				log.error(e.getMessage(), new Throwable(e));
			}
		}

		log.info("HttpPoster:[total time=" + watch.getTime() + ", url=" + strURL + ", contentType=" + contentType + ",ecode=" + encode + ",response=" + result + "]");

		return result;
	}

	/**
	 * 按照utf-8编码，发送字符串到url
	 * 
	 * @param strURL
	 * @param req
	 * @return void
	 */
	public static void post(String strURL, String req) {
		post(strURL, req, "application/x-www-form-urlencoded", "UTF-8", false, null);
	}

	/**
	 * 按照utf-8编码，发送字符串到url
	 * 
	 * @param strURL
	 * @param req
	 * @return url返回结果
	 */
	public static String postWithRes(String strURL, String req) {
		return post(strURL, req, "application/x-www-form-urlencoded", "UTF-8", true, null);
	}

	/**
	 * 按照utf-8编码，发送字符串到url
	 * 
	 * @param strURL
	 * @param req
	 * @param headers头信息
	 * @return url返回结果
	 */
	public static String postWithRes(String strURL, String req, Map<String, String> headers) {
		return post(strURL, req, "application/x-www-form-urlencoded", "UTF-8", true, headers);
	}

	/**
	 * 按照utf-8编码，发送字符串到url
	 * 
	 * @param strURL
	 * @param req
	 * @param headers头信息
	 * @return url返回结果
	 */
	public static String postWithRes(String strURL, byte[] req, Map<String, String> headers) {
		return post(strURL, req, "application/x-www-form-urlencoded", "UTF-8", true, headers);
	}

	/**
	 * 按照utf-8编码，发送字符串到url
	 * 
	 * @param strURL
	 * @param req
	 * @param headers头信息
	 * @return url返回结果
	 */
	public static String postWithPath(String strURL, String path, Map<String, String> headers) {
		return postPath(strURL, path, "application/x-www-form-urlencoded", "UTF-8", true, headers);
	}

	/**
	 * 按照utf-8编码，发送json到url
	 * 
	 * @param strURL
	 * @param json
	 * @return url返回结果
	 */
	public static String postJSONWithRes(String strURL, String json) {
		return post(strURL, json, "application/json", "UTF-8", true, null);
	}

	/**
	 * 按照utf-8编码，发送json到url
	 * 
	 * @param strURL
	 * @param json
	 * @param headers头信息
	 * @return url返回结果
	 */
	public static String postJSONWithRes(String strURL, String json, Map<String, String> headers) {
		return post(strURL, json, "application/json", "UTF-8", true, headers);
	}

	/**
	 * 按照utf-8编码，发送xml到url
	 * 
	 * @param strURL
	 * @param xml
	 * @return url返回结果
	 */
	public static String postXMLWithRes(String strURL, String xml) {
		return post(strURL, xml, "text/xml", "UTF-8", true, null);
	}

	/**
	 * 按照utf-8编码，发送xml到url
	 * 
	 * @param strURL
	 * @param xml
	 * @param headers头信息
	 * @return url返回结果
	 */
	public static String postXMLWithRes(String strURL, String xml, Map<String, String> headers) {
		return post(strURL, xml, "text/xml", "UTF-8", true, headers);
	}

	/**
	 * 按照指定编码，发送字符串到url
	 * 
	 * @param strURL
	 *            请求url
	 * @param req
	 *            请求内容
	 * @param encode
	 *            编码格式
	 * @param response
	 *            是否处理url返回的内容
	 * @return
	 */
	private static String post(String strURL, String req, String contentType, String encode, boolean response, Map<String, String> headers) {

		StopWatch watch = new StopWatch();
		watch.start();

		String result = null;
		BufferedOutputStream out = null;
		BufferedInputStream in = null;
		try {
			URL url = new URL(strURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", contentType);
			con.setRequestProperty("Comp-Control", "dsmp/sms-mt");
			if (headers != null && headers.size() > 0) {
				Set<String> keys = headers.keySet();
				Iterator<String> ir = keys.iterator();

				while (ir.hasNext()) {
					String key = ir.next();
					con.setRequestProperty(key, headers.get(key));
				}
			}
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setConnectTimeout(60000);
			con.setReadTimeout(60000);

			out = new BufferedOutputStream(con.getOutputStream());
			byte outBuf[] = req.getBytes(encode);
			out.write(outBuf);
			out.flush();
			if (response) {
				in = new BufferedInputStream(con.getInputStream());
				result = readByteStream(in, encode);
			} else {
				con.getInputStream();
			}
		} catch (Exception ex) {
			log.error(ex.getMessage(), new Throwable(ex));
		} finally {
			try {
				if (out != null)
					out.close();
				if (in != null)
					in.close();
			} catch (IOException e) {
				log.error(e.getMessage(), new Throwable(e));
			}
		}

		log.info("HttpPoster:[total time=" + watch.getTime() + ", url=" + strURL + ",  req=" + req + ", contentType=" + contentType + ",ecode=" + encode + ",response=" + result + "]");

		return result;
	}

	/**
	 * 按照指定编码，发送字符串到url
	 * 
	 * @param strURL
	 *            请求url
	 * @param req
	 *            请求内容
	 * @param encode
	 *            编码格式
	 * @param response
	 *            是否处理url返回的内容
	 * @return
	 */
	private static String post(String strURL, byte[] req, String contentType, String encode, boolean response, Map<String, String> headers) {

		StopWatch watch = new StopWatch();
		watch.start();

		String result = null;
		BufferedOutputStream out = null;
		BufferedInputStream in = null;
		try {
			URL url = new URL(strURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", contentType);
			con.setRequestProperty("Comp-Control", "dsmp/sms-mt");
			if (headers != null && headers.size() > 0) {
				Set<String> keys = headers.keySet();
				Iterator<String> ir = keys.iterator();

				while (ir.hasNext()) {
					String key = ir.next();
					con.setRequestProperty(key, headers.get(key));
				}
			}
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setConnectTimeout(30000);
			con.setReadTimeout(30000);

			out = new BufferedOutputStream(con.getOutputStream());
			out.write(req);
			out.flush();
			if (response) {
				in = new BufferedInputStream(con.getInputStream());
				result = readByteStream(in, encode);
			} else {
				con.getInputStream();
			}
		} catch (Exception ex) {
			log.error(ex.getMessage(), new Throwable(ex));
		} finally {
			try {
				if (out != null)
					out.close();
				if (in != null)
					in.close();
			} catch (IOException e) {
				log.error(e.getMessage(), new Throwable(e));
			}
		}

		log.info("HttpPoster:[total time=" + watch.getTime() + ", url=" + strURL + ", contentType=" + contentType + ",ecode=" + encode + ",response=" + result + "]");

		return result;
	}

	/**
	 * 按照指定编码，发送字符串到url
	 * 
	 * @param strURL
	 *            请求url
	 * @param req
	 *            请求内容
	 * @param encode
	 *            编码格式
	 * @param response
	 *            是否处理url返回的内容
	 * @return
	 */
	private static String postPath(String strURL, String path, String contentType, String encode, boolean response, Map<String, String> headers) {

		StopWatch watch = new StopWatch();
		watch.start();

		String result = null;
		BufferedOutputStream out = null;
		BufferedInputStream in = null;
		FileInputStream is = null;

		try {

			URL url = new URL(strURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", contentType);
			con.setRequestProperty("Comp-Control", "dsmp/sms-mt");
			if (headers != null && headers.size() > 0) {
				Set<String> keys = headers.keySet();
				Iterator<String> ir = keys.iterator();

				while (ir.hasNext()) {
					String key = ir.next();
					con.setRequestProperty(key, headers.get(key));
				}
			}
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setConnectTimeout(30000);
			con.setReadTimeout(30000);

			out = new BufferedOutputStream(con.getOutputStream());

			File file = new File(path);
			is = new FileInputStream(file.getPath());
			// 设定读取的字节数
			byte[] inc = new byte[1024];
			int insize = 0;
			while ((insize = is.read(inc)) != -1) {
				out.write(inc, 0, insize);
			}
			out.flush();
			if (response) {
				in = new BufferedInputStream(con.getInputStream());
				result = readByteStream(in, encode);
			} else {
				con.getInputStream();
			}
		} catch (Exception ex) {
			log.error(ex.getMessage());
		} finally {

			try {

				if (is != null) {
					is.close();
				}

				if (out != null) {
					out.close();
				}

				if (in != null) {
					in.close();
				}
			} catch (IOException e) {
				log.error(e.getMessage(), new Throwable(e));
			}
		}

		log.info("HttpPoster:[total time=" + watch.getTime() + ", url=" + strURL + ", contentType=" + contentType + ",ecode=" + encode + ",response=" + result + "]");

		return result;
	}

	public static String readByteReqStream(ServletRequest request, String encode) throws IOException {
		ServletInputStream in = request.getInputStream();
		LinkedList<Object> bufList = new LinkedList<Object>();
		int size = 0;
		byte buf[];
		do {
			buf = new byte[128];
			int num = in.read(buf);
			if (num == -1)
				break;
			size += num;
			bufList.add(new mybuf(buf, num));
		} while (true);
		buf = new byte[size];
		int pos = 0;
		for (ListIterator<Object> p = bufList.listIterator(); p.hasNext();) {
			mybuf b = (mybuf) p.next();
			int i = 0;
			while (i < b.size) {
				buf[pos] = b.buf[i];
				i++;
				pos++;
			}
		}
		return new String(buf, encode);
	}

	/**
	 * 按照指定编码读取字节流
	 * 
	 * @param in
	 * @param encode
	 * @return
	 * @throws IOException
	 */
	public static String readByteStream(BufferedInputStream in, String encode) throws IOException {
		LinkedList<Object> bufList = new LinkedList<Object>();
		int size = 0;
		byte buf[];
		do {
			buf = new byte[128];
			int num = in.read(buf);
			if (num == -1)
				break;
			size += num;
			bufList.add(new mybuf(buf, num));
		} while (true);
		buf = new byte[size];
		int pos = 0;
		for (ListIterator<Object> p = bufList.listIterator(); p.hasNext();) {
			mybuf b = (mybuf) p.next();
			int i = 0;
			while (i < b.size) {
				buf[pos] = b.buf[i];
				i++;
				pos++;
			}
		}
		return new String(buf, encode);
	}

	private static class mybuf {

		public mybuf(byte b[], int s) {
			buf = b;
			size = s;
		}

		public byte buf[];

		public int size;
	}

}
