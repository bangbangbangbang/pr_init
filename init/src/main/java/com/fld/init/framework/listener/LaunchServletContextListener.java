package com.fld.init.framework.listener;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import com.fld.framework.entity.Entry;
import com.fld.framework.util.IpUtils;
import com.fld.init.framework.constant.ConstantParams;
import com.fld.init.framework.util.LogUtils;

/**
 * 项目启动时预先设置的参数
 * 
 * @author
 * 
 */
public class LaunchServletContextListener implements ServletContextListener {

  @Override
  public void contextDestroyed(ServletContextEvent arg0) {}

  @Override
  public void contextInitialized(ServletContextEvent event) {
    ServletContext sc = event.getServletContext();

    Entry<String, Integer> entry = null;
    int port = 0;
    String ip = null;
    String dubboPort = "402";

    ip = IpUtils.getLocalIpAddr();
    String projectPort = sc.getInitParameter(ConstantParams.SYSTEM_PROJECT_PORT);
    if (NumberUtils.isNumber(projectPort) && Integer.parseInt(projectPort) > 0) {
      port = Integer.parseInt(projectPort);
    } else {
      entry = getPort(sc);
      port = entry.getMsg();
    }

    System.setProperty(ConstantParams.SYSTEM_PROJECT_PORT, String.valueOf(port));
    System.setProperty(ConstantParams.SYSTEM_PROJECT_IP, ip);

    if (null != entry && !entry.isSuccess()) {
      LogUtils.error("project.port init failure");
    }
    Integer tmp = port % 100;
    if (tmp < 10) {
      dubboPort += "0" + String.valueOf(tmp);
    } else {
      dubboPort += String.valueOf(tmp);
    }

    System.setProperty(ConstantParams.SYSTEM_PROJECT_DUBBO_PORT, dubboPort);

    System.setProperty(ConstantParams.SYSTEM_PROJECT_LOCAL, isLocal(sc).toString());
  }

  private Boolean isLocal(ServletContext sc) {
    String realPath = sc.getRealPath("/");
    return realPath.replace("\\", "/").contains("src/main/webapp");
  }

  private Entry<String, Integer> getPort(ServletContext sc) {
    Entry<String, Integer> entry = new Entry<String, Integer>();

    String realPath = sc.getRealPath("/");

    String regex = sc.getInitParameter(ConstantParams.SYSTEM_PATTERN_PORT);
    if (StringUtils.isNotBlank(regex)) {
      Matcher matcher = Pattern.compile(regex).matcher(realPath);
      if (matcher.matches()) {
        return entry.put(Entry.SUCCESS, Integer.parseInt(matcher.group(1)));
      }
    }
    if (isLocal(sc)) {
      return entry.put(Entry.ERROR, 8080);
    }

    return entry.put(Entry.ERROR, 10000 + new Random().nextInt(10000));
  }

}
