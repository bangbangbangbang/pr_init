package com.fld.framework.util;

/**
 * 
 * @ClassName: TxtDealUtil
 * @Description: 文本处理工具
 * @author zhaokuner
 * @date 2016年7月27日 下午2:49:28
 *
 */
public class TxtDealUtil {

	/**
	 * 
	 * @Title: defaultNull
	 * @Description: null == o ? null : o.toString();
	 * @author zhaokuner
	 * @param o
	 * @return
	 */
	public static String defaultNull(Object o) {
		return null == o ? null : o.toString();
	}

	/**
	 * 
	 * @Title: defaultBlank
	 * @Description: null == o ? "" : o.toString();
	 * @author zhaokuner
	 * @param o
	 * @return
	 */
	public static String defaultBlank(Object o) {
		return null == o ? "" : o.toString();
	}

	/**
	 * 
	 * @Title: rnToTr
	 * @Description: \r or \n or \r\n to %3Cbr%3E (=URLCoderUtil.encodeUTF8("&lt;br&gt;"))
	 * @author zhaokuner
	 * @return
	 */
	public static String rnToBrCode(String txt) {
		if (null == txt || txt.isEmpty()) {
			return txt;
		}
		return txt.replaceAll("\r\n", "%3Cbr%3E").replaceAll("\r", "%3Cbr%3E").replaceAll("\n", "%3Cbr%3E");
	}

	/**
	 * 
	 * @Title: rnToSpace
	 * @Description:回车换行转空格
	 * @author laijie.zhang
	 * @param txt
	 * @return
	 */
	public static String rnToSpace(String txt) {
		if (null == txt || txt.isEmpty()) {
			return txt;
		}
		return txt.replaceAll("\r\n", " ").replaceAll("\r", " ").replaceAll("\n", " ");
	}

	/**
	 * 
	 * @Title: brCodeToRn
	 * @Description: %3Cbr%3E to \r\n
	 * @author zhaokuner
	 * @param txt
	 * @return
	 */
	public static String brCodeToRn(String txt) {
		if (null == txt || txt.isEmpty()) {
			return txt;
		}
		return txt.replaceAll("%3Cbr%3E", "\r\n");
	}

	/**
	 * 
	 * @Title: brCodeToBr
	 * @Description: %3Cbr%3E to &lt;br&gt;
	 * @author zhaokuner
	 * @param txt
	 * @return
	 */
	public static String brCodeToBr(String txt) {
		if (null == txt || txt.isEmpty()) {
			return txt;
		}
		return txt.replaceAll("%3Cbr%3E", "<br>");
	}

	/**
	 * 
	 * @Title: brCodeToWipe
	 * @Description: %3Cbr%3E to "" 消除转义
	 * @author yifan
	 * @param txt
	 * @return
	 */
	public static String brCodeToWipe(String txt) {
		if (null == txt || txt.isEmpty()) {
			return txt;
		}
		return txt.replaceAll("%3Cbr%3E", "");
	}

	/**
	 * 
	 * @Title: brCodeToWipe
	 * @Description: 转义中文字符
	 * @author yifan
	 * @param txt
	 * @return
	 */
	public static String zhCharToEnChar(String txt) {
		if (null == txt || txt.isEmpty()) {
			return txt;
		}
		txt = txt.replace("，", ",");
		txt = txt.replace("；", ";");
		txt = txt.replace("！", "!");
		txt = txt.replace("？", "?");
		txt = txt.replace("。", ".");

		return txt;
	}

	/**
	 * 
	 * @Title: substring
	 * @Description: 字符串截取
	 * @author zhaokuner
	 * @param txt
	 * @param index
	 *            从0开始
	 * @param count
	 * @return
	 */
	public static String substring(String txt, int index, int count) {
		if (null == txt || txt.length() <= index) {
			return "";
		}
		return txt.length() > count + index ? txt.substring(index, index + count) : txt.substring(index);
	}
}
