package com.fld.init.framework.runtime;

import org.apache.commons.lang3.StringUtils;
import com.fld.framework.dto.api.ApiReqContent;
import com.fld.framework.dto.api.ApiResp;

public class ApiHolder {

  private static ThreadLocal<ApiObject> threadLocal = new ThreadLocal<ApiObject>() {
    @Override
    protected ApiObject initialValue() {
      return new ApiObject();
    }
  };


  public static ApiReqContent getApiReqContent() {
    return threadLocal.get().getApiReqContent();
  }

  public static void setApiReqContent(ApiReqContent apiReqContent) {
    threadLocal.get().setApiReqContent(apiReqContent);
  }

  public static ApiResp getApiResp() {
    return threadLocal.get().getApiResp();
  }

  public static void setApiResp(ApiResp apiResp) {
    threadLocal.get().setApiResp(apiResp);
  }

  public static String getData() {
    return get().getData();
  }

  public static void setOriginalData(String originalData) {
    threadLocal.get().setOriginalData(originalData);
  }

  public static String getOriginalData() {
    return threadLocal.get().getOriginalData();
  }

  public static ApiObject get() {
    return threadLocal.get();
  }

  public static void cleanLocal() {
    threadLocal.remove();
  }

  public static class ApiObject {

    private ApiReqContent apiReqContent = new ApiReqContent();

    private ApiResp apiResp = new ApiResp();

    private String secretKey = "";

    private String appId = "";

    private Integer appType;

    private String openId = "";

    private String data = "";

    private String originalData = "";

    public ApiReqContent getApiReqContent() {
      return apiReqContent;
    }

    public void setApiReqContent(ApiReqContent apiReqContent) {
      this.apiReqContent = apiReqContent;
    }

    public ApiResp getApiResp() {
      return apiResp;
    }

    public void setApiResp(ApiResp apiResp) {
      this.apiResp = apiResp;
    }

    public String getSecretKey() {
      return secretKey;
    }

    public void setSecretKey(String secretKey) {
      this.secretKey = secretKey;
    }

    public String getAppId() {
      return appId;
    }

    public void setAppId(String appId) {
      this.appId = appId;
    }

    public Integer getAppType() {
      return appType;
    }

    public void setAppType(Integer appType) {
      this.appType = appType;
    }

    public String getOpenId() {
      return openId;
    }

    public void setOpenId(String openId) {
      this.openId = openId;
    }

    public String getData() {
      return data;
    }

    public void setData(String data) {
      this.data = data;
    }

    public String getOriginalData() {
      return originalData;
    }

    public void setOriginalData(String originalData) {
      this.originalData = originalData;
    }

    @Override
    public String toString() {
      StringBuilder builder = new StringBuilder();
      builder.append("ApiObject [apiReqContent=");
      builder.append(apiReqContent);
      builder.append(", apiResp=");
      builder.append(apiResp);
      builder.append(", secretKey=");
      if (StringUtils.isNotBlank(secretKey)) {
        builder.append("******");
      } else {
        builder.append(secretKey);
      }
      builder.append(", appId=");
      builder.append(appId);
      builder.append(", appType=");
      builder.append(appType);
      builder.append(", openId=");
      builder.append(openId);
      builder.append(", data=");
      builder.append(data);
      builder.append(", originalData=");
      builder.append(originalData);
      builder.append("]");
      return builder.toString();
    }

  }

}
