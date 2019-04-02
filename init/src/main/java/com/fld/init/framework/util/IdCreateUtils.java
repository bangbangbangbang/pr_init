package com.fld.init.framework.util;

import java.util.UUID;

/**
 * 
 * @ClassName: IdCreateUtils
 * @Description: 生成ID
 * @author
 * @date 2016年4月7日 下午5:42:43
 *
 */
public class IdCreateUtils {
  /**
   * 
   * @Title: uuid
   * @Description: uuid 去掉-
   * @author zhaokuner
   * @return randomUUID().toString().replaceAll("-", "");
   */
  public static String uuid() {
    return UUID.randomUUID().toString().replaceAll("-", "");
  }
}
