package com.fld.init.model.log;

import com.fld.framework.dto.Device;
import com.fld.framework.util.JacksonUtils;

/**
 * @Title: CtrlLog.java
 * @Package com.sevenchildren.yzmm.model.log
 * @Description:
 * @author guowei.zhang
 * @Company www.sevenkids.cn
 * @date 2016年6月29日 上午11:32:09
 * @version V1.0
 */
public class CtrlLog {

  private String reqId;// 请求ID

  private String reqTime;// 请求时间

  private String uid;// 请求用户UID

  private String rank;// 用户身份un不知道 none 没有 vip 会员

  private String refer;// 请求refer

  private String serviceId;// 服务ID

  private String serviceType;// 服务类型

  private String serviceVersion;// 服务版本号

  private String reqIp;// 请求IP

  private String reqUri;// 请求URI

  private Device device;// 终端设备信息

  private String reqParams;// 请求参数

  private int theday;// 日期

  public CtrlLog() {}

  public CtrlLog(String reqId, String reqTime, String uid, String rank, String serviceId,
      String serviceType, String serviceVersion, String reqIp, String reqUri, String reqParams,
      int theday, String refer, Device device) {
    this.reqId = reqId;
    this.reqTime = reqTime;
    this.uid = uid;
    this.rank = rank;
    this.serviceId = serviceId;
    this.serviceType = serviceType;
    this.serviceVersion = serviceVersion;
    this.reqIp = reqIp;
    this.reqUri = reqUri;
    this.reqParams = reqParams;
    this.theday = theday;
    this.refer = refer;
    this.device = device;
  }

  public String getReqId() {
    return reqId;
  }

  public void setReqId(String reqId) {
    this.reqId = reqId;
  }

  public String getReqTime() {
    return reqTime;
  }

  public void setReqTime(String reqTime) {
    this.reqTime = reqTime;
  }

  public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public String getServiceId() {
    return serviceId;
  }

  public void setServiceId(String serviceId) {
    this.serviceId = serviceId;
  }

  public String getServiceType() {
    return serviceType;
  }

  public void setServiceType(String serviceType) {
    this.serviceType = serviceType;
  }

  public String getServiceVersion() {
    return serviceVersion;
  }

  public void setServiceVersion(String serviceVersion) {
    this.serviceVersion = serviceVersion;
  }

  public String getReqIp() {
    return reqIp;
  }

  public void setReqIp(String reqIp) {
    this.reqIp = reqIp;
  }

  public String getReqUri() {
    return reqUri;
  }

  public void setReqUri(String reqUri) {
    this.reqUri = reqUri;
  }

  public String getReqParams() {
    return reqParams;
  }

  public void setReqParams(String reqParams) {
    this.reqParams = reqParams;
  }

  public int getTheday() {
    return theday;
  }

  public void setTheday(int theday) {
    this.theday = theday;
  }

  public String getRefer() {
    return refer;
  }

  public void setRefer(String refer) {
    this.refer = refer;
  }

  public Device getDevice() {
    return device;
  }

  public void setDevice(Device device) {
    this.device = device;
  }

  public String toJson() {
    return JacksonUtils.toJson(this);
  }

  public String getRank() {
    return rank;
  }

  public void setRank(String rank) {
    this.rank = rank;
  }
}
