package com.fld.framework.dto;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import com.fld.framework.util.JacksonUtils;

/**
 * 设备信息
 */
public class Device implements Serializable {

	private static final long serialVersionUID = -515304553575107218L;

	public static final String PARAMS_DEVICE = "device";

	/** 设备ID */
	private String deviceId;
	/** 手机型号 */
	private String model;
	/** 用户设备操作系统 */
	private String os;
	/** 用户设备操作系统版本号 */
	private String osVer;
	/** 网络类型:3g wifi等 */
	private String netType;
	/** 用户手机号 */
	private String tel;
	/** 运营商名称 */
	private String netServer;
	/** 分辨率 */
	private String screen;
	/** 手机码 */
	private String imsi;
	/** mac */
	private String mac;
	/** ip */
	private String ip;
	/** abi */
	private String abi;
	/** 浏览器 */
	private String userAgent;
	/** 窗口宽度 */
	private String width;
	/** 窗口高度 */
	private String height;
	/** 设置的语言 */
	private String language;
	/** 客户端平台 */
	private String platform;

	public Device() {

	}

	public static Device init(HttpServletRequest req) {

		Device result = null;

		if (req != null) {
			String device = req.getParameter(PARAMS_DEVICE);
			result = init(device);
		}
		if (null == result) {
			result = new Device();
		}

		return result;
	}

	public static Device init(String device) {

		Device result = null;

		if (StringUtils.isNotBlank(device)) {
			result = JacksonUtils.readValue(device, Device.class);
		}
		if (null == result) {
			result = new Device();
		}
		return result;
	}

	public String toJson() {
		String json = JacksonUtils.toJson(this);
		return json;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getOs() {
		return os;
	}

	public void setOs(String os) {
		this.os = os;
	}

	public String getOsVer() {
		return osVer;
	}

	public void setOsVer(String osVer) {
		this.osVer = osVer;
	}

	public String getNetType() {
		return netType;
	}

	public void setNetType(String netType) {
		this.netType = netType;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getNetServer() {
		return netServer;
	}

	public void setNetServer(String netServer) {
		this.netServer = netServer;
	}

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}

	public String getImsi() {
		return imsi;
	}

	public void setImsi(String imsi) {
		this.imsi = imsi;
	}

	public String getMac() {
		return mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getAbi() {
		return abi;
	}

	public void setAbi(String abi) {
		this.abi = abi;
	}

	public String getUserAgent() {
		return userAgent;
	}

	public void setUserAgent(String userAgent) {
		this.userAgent = userAgent;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Device [deviceId=");
		builder.append(deviceId);
		builder.append(", model=");
		builder.append(model);
		builder.append(", os=");
		builder.append(os);
		builder.append(", osVer=");
		builder.append(osVer);
		builder.append(", netType=");
		builder.append(netType);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", netServer=");
		builder.append(netServer);
		builder.append(", screen=");
		builder.append(screen);
		builder.append(", imsi=");
		builder.append(imsi);
		builder.append(", mac=");
		builder.append(mac);
		builder.append(", ip=");
		builder.append(ip);
		builder.append(", abi=");
		builder.append(abi);
		builder.append(", userAgent=");
		builder.append(userAgent);
		builder.append(", width=");
		builder.append(width);
		builder.append(", height=");
		builder.append(height);
		builder.append(", language=");
		builder.append(language);
		builder.append(", platform=");
		builder.append(platform);
		builder.append("]");
		return builder.toString();
	}

}
