package com.fld.init.dao;



import java.util.ArrayList;
import java.util.Map;


public interface ISuperDao<T extends java.io.Serializable> {

  int save(T t);

  int save(Map<String, Object> params);

  int delete(Map<String, Object> params);

  int update(T t);

  int update(Map<String, Object> params);

  ArrayList<T> findList(Map<String, Object> params);

  ArrayList<T> findList();

  long count();

  int count(Map<String, Object> params);
}
