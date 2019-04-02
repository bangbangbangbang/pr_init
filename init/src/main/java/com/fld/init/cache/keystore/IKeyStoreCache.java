package com.fld.init.cache.keystore;

/**
 * 存储key
 * 
 * @author
 *
 */
public interface IKeyStoreCache {

  /**
   * 本系统发给serviceId的key
   * 
   * @param serviceId
   * @return
   */
  String getMykey(String serviceId);

  /**
   * 目标serviceId系统发给本系统的key
   * 
   * @param serviceId
   * @return
   */
  String getTargekey(String targetServiceId);

}
