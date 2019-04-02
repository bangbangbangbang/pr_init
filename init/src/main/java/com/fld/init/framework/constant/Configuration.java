package com.fld.init.framework.constant;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ResourceBundle;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

/**
 * 
 * @author
 *
 */
public class Configuration {

  private static Object lock = new Object();
  private static Configuration config = null;
  private static ResourceBundle rb = null;
  private static final String CONFIG_FILE = "conf/config";

  private Configuration() {
    rb = ResourceBundle.getBundle(CONFIG_FILE);
  }


  /**
   * 服务name
   */
  public static String SERVICE_NAME = "";
  /**
   * 服务ID
   */
  public static String SERVICE_ID = "";
  /**
   * 服务版本号
   */
  public static String SERVICE_VERSION = "";
  /**
   * 服务类型
   */
  public static String SERVICE_TYPE = "";
  /**
   * H5服务ID
   */
  public static String SERVICE_ID_H5 = "";
  /**
   * WEB服务ID
   */
  public static String SERVICE_ID_WEB = "";

  /**
   * 仅能有一个登录设备登录的serviceId
   */
  public static String LOGIN_UNIQUE_SERVICEID = "";
  /**
   * 默认登录在线时间
   */
  public static Integer DEFALUT_LOGIN_SCOPETIME = 60 * 60 * 24 * 7;

  /**
   * RoleArn 需要在 RAM 控制台上获取
   */
  public static String ALIYUN_VOD_ROLE_ARN = "";
  /**
   * 一小时的秒
   */
  public static Integer ONE_HOUR_SECOND = 60 * 60;
  /**
   * 一天的秒
   */
  public static Integer ONE_DAY_SECOND = 60 * 60 * 24;
  /**
   * 一星期的秒
   */
  public static Integer ONE_WEEK_SECOND = 60 * 60 * 24 * 7;
  /**
   * 一月的秒
   */
  public static Integer ONE_MONTH_SECOND = 60 * 60 * 24 * 30;
  /**
   * 一年的秒
   */
  public static Integer ONE_YEAR_SECOND = 60 * 60 * 24 * 365;
  /**
   * 多会话数量限制
   */
  public static Integer LOGIN_MULTIPOINT_NUM = 5;
  /**
   * 时间段内最多登录次数
   */
  public static Integer LOGIN_COUNT_LIMIT = 50;
  /**
   * 处理登录时在线信息线程池数量
   */
  public static Integer POOL_ONLINE_TREAD = 10;
  /**
   * 安全验证连续两次间隔时间(秒)
   */
  public static Integer SECURITY_VERIFICATION_INTERVAL_TIME = 60;
  /**
   * 安全验证验证码有效时间(秒)
   */
  public static Integer SECURITY_VERIFICATION_SCOPE_TIME = 600;
  /**
   * 激活码有效时间(秒)
   */
  public static Integer SECURITY_ACTIVATION_SCOPE_TIME = 1200;
  /**
   * H5登录验证码有效时间（秒）
   */
  public static Integer H5LOGIN_VERIFICATION_CODE_SCOPE_TIME = 1800;
  /**
   * 项目运行端口
   */
  public static Integer PROJECT_RUNTIME_PORT = Integer.MAX_VALUE;
  /**
   * 项目运行IP
   */
  public static String PROJECT_RUNTIME_IP = "";
  /**
   * 本地启动
   */
  public static Boolean SYSTEM_PROJECT_LOCAL = false;
  /**
   * 生成启动
   */
  public static Boolean SYSTEM_PROJECT_ONLINE = true;

  /**
   * 根域
   */
  public static String SSO_DOMAIN = "";

  /**
   * 项目简称
   */
  public static String PROJECT_SHORT_NAME = "";
  /**
   * 服务域名
   */
  public static String SERVICE_DOMAIN = "";
  /**
   * 静态资源文件目录
   */
  public static String STATIC_RESOURSE_DISK_PATH = "";
  /**
   * CDN静态资源文件http访问路径
   */
  public static String STATIC_RESOURSE_HTTP_URL = "";

  public static final String STATIC_TEMP_FILE = "tempc";
  public static final String STATIC_UPLOAD_FILE = "uploadc";
  public static final String STATIC_ALBUM = "album";

  public static Charset CHARSET = Charset.forName("UTF-8");



  public static Integer SHARE_TO_FRIEND_COUNT = 5;

  static {
    init();
  }

  private static void init() {
    Configuration conf = getInstance();
    try {
      SERVICE_NAME = new String(conf.getValue("service.name").getBytes("ISO-8859-1"), "UTF-8");
    } catch (UnsupportedEncodingException e) {
    }
    SERVICE_ID_H5 = conf.getValue("service.id.h5");
    SERVICE_ID_WEB = conf.getValue("service.id.web");
    SERVICE_ID = conf.getValue("service.id");
    SERVICE_VERSION = conf.getValue("service.version");
    SERVICE_TYPE = conf.getValue("service.type");
    String env = conf.getValue("service.env");
    SYSTEM_PROJECT_ONLINE = "online".equals(StringUtils.defaultIfBlank(env, "online"));
    LOGIN_UNIQUE_SERVICEID =
        StringUtils.defaultString(conf.getValue("login.unique.serviceId")).trim();
    if (LOGIN_UNIQUE_SERVICEID.equals(",")) {
      LOGIN_UNIQUE_SERVICEID = "";
    } else if (!LOGIN_UNIQUE_SERVICEID.endsWith(",")) {
      LOGIN_UNIQUE_SERVICEID += ",";
    }
    DEFALUT_LOGIN_SCOPETIME =
        NumberUtils.toInt(conf.getValue("defalut.login.scopetime"), DEFALUT_LOGIN_SCOPETIME);
    LOGIN_MULTIPOINT_NUM =
        NumberUtils.toInt(conf.getValue("login.multipoint.num"), LOGIN_MULTIPOINT_NUM);
    LOGIN_COUNT_LIMIT = NumberUtils.toInt(conf.getValue("login.count.limit"), LOGIN_COUNT_LIMIT);
    POOL_ONLINE_TREAD = NumberUtils.toInt(conf.getValue("pool.online.tread"), POOL_ONLINE_TREAD);

    SECURITY_VERIFICATION_INTERVAL_TIME = NumberUtils.toInt(
        conf.getValue("security.verification.interval.time"), SECURITY_VERIFICATION_INTERVAL_TIME);
    SECURITY_VERIFICATION_SCOPE_TIME = NumberUtils
        .toInt(conf.getValue("security.verification.scope.time"), SECURITY_VERIFICATION_SCOPE_TIME);
    PROJECT_RUNTIME_PORT = NumberUtils.toInt(System.getProperty(ConstantParams.SYSTEM_PROJECT_PORT),
        Integer.MAX_VALUE);
    PROJECT_RUNTIME_IP = System.getProperty(ConstantParams.SYSTEM_PROJECT_IP);
    SYSTEM_PROJECT_LOCAL = Boolean.valueOf(System.getProperty(ConstantParams.SYSTEM_PROJECT_LOCAL));
    CookieConfig._HAOHAN_ = conf.getValue("_haohan_");

    SERVICE_DOMAIN = conf.getValue("service.domain");
    PROJECT_RUNTIME_IP = System.getProperty(ConstantParams.SYSTEM_PROJECT_IP);
    SSO_DOMAIN = conf.getValue("sso.domain");
    CookieConfig._JSESSIONID_ = conf.getValue("_jsessionid_");
    CookieConfig._VCODE_ = conf.getValue("_vcode_");
    PROJECT_SHORT_NAME = conf.getValue("project.short.name");
    STATIC_RESOURSE_DISK_PATH = conf.getValue("static.resourse.disk.path");
    STATIC_RESOURSE_HTTP_URL = conf.getValue("static.resourse.http.url");

  }

  /**
   * 初始化本地文件
   */
  public static void initLocalConf() {
    ResourceBundle.clearCache();
    rb = ResourceBundle.getBundle(CONFIG_FILE);
    config = null;
    init();
  }

  public static Configuration getInstance() {
    synchronized (lock) {
      if (null == config) {
        config = new Configuration();
      }
    }
    return (config);
  }

  public String getValue(String key) {
    return (rb.getString(key));
  }

}
