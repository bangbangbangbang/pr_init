package com.fld.init.cache;

import java.io.Serializable;
import java.util.Map;
import org.springframework.stereotype.Component;

@Component
public class CommCacheUtil {

  public static RedisCachedManager cache;

  // @Resource(name = "commonCache")
  public void setCache(RedisCachedManager cache) {
    CommCacheUtil.cache = cache;
  }

  /**
   * 若不存在则添加操作(对象)
   * 
   * @param key
   * @param o
   * @return
   */
  public static boolean setNX(String key, Serializable o) {
    return cache.setNX(key, o);
  }

  /**
   * 若不存在则添加操作(对象)
   * 
   * @param key
   * @param exprieInSecond 超时时间单位秒
   * @param o
   * @return
   */
  public static boolean setNX(String key, int exprieInSecond, Serializable o) {
    return cache.setNX(key, exprieInSecond, o);
  }

  /**
   * 添加操作(对象)
   * 
   * @param key
   * @param o
   * @return
   */
  public static boolean set(String key, Serializable o) {
    return cache.set(key, o);
  }

  /**
   * 对应于set操作，没有就add，有就replace
   * 
   * @param key
   * @param exprieInSecond 超时时间单位秒
   * @param o
   * @return
   */
  public static boolean set(String key, int exprieInSecond, Serializable o) {
    return cache.set(key, exprieInSecond, o);
  }

  /**
   * 取单个信息(对象)
   * 
   * @param key
   * @return Object
   */
  public static String get(String key) {
    return cache.get(key);
  }

  /**
   * 取单个信息(对象)
   * 
   * @param key
   * @return Object
   */
  public static <T extends Serializable> T get(String key, Class<T> clazz) {
    return cache.get(key, clazz);
  }

  /**
   * 取多个信息
   * 
   * @param key
   * @return
   */
  public static Map<String, String> getMultiString(String... key) {
    return cache.getMultiString(key);
  }

  /**
   * 删除 本类总接口全部捕获异常
   * 
   * @param key
   * @return
   */
  public static boolean remove(String key) {
    return cache.remove(key);
  }

  /**
   * 将相关key的value加一返回
   */
  public static long addOrIncr(String key) {
    return cache.addOrIncr(key);
  }

  /**
   * 将相关key的value加指定值返回现
   */
  public static long addOrIncr(String key, int incrValue) {
    return cache.addOrIncr(key, incrValue);
  }

  /**
   * 
   * @Description:设置过期时间
   * @param key
   * @param exprieInSecond 单位：秒
   * @return boolean
   * 
   */
  public static boolean expire(String key, int exprieInSecond) {
    return cache.expire(key, exprieInSecond);
  }

  /**
   * 
   * @Description:判断key是否存在
   * @param key
   * @return boolean
   * 
   */
  public static boolean hasKey(String key) {
    return cache.hasKey(key);
  }

  /**
   * 
   * @Description:获取hash
   * @param key
   * @return Map<String,String>
   * 
   */
  public static Map<String, String> getHash(String key) {
    return cache.getHash(key);
  }

  /**
   * 
   * @Description:
   * @param key
   * @param hashKey
   * @return Object
   * 
   */
  public static String getHash(String key, String hashKey) {
    return cache.getHash(key, hashKey);
  }

  /**
   * 
   * @Description:
   * @param key
   * @param m
   * @return boolean
   * 
   */
  public static boolean setHash(String key, Map<String, String> m) {
    return cache.setHash(key, m);
  }

  /**
   * 
   * @Description:
   * @param key
   * @param hashKey
   * @param hashValue
   * @return boolean
   * 
   */
  public static boolean setHash(String key, String hashKey, String hashValue) {
    return cache.setHash(key, hashKey, hashValue);
  }

  /**
   * 
   * @Description:
   * @param key
   * @param hashKey
   * @return boolean
   */
  public static boolean removeHash(String key, String hashKey) {
    return cache.removeHash(key, hashKey);
  }

}
