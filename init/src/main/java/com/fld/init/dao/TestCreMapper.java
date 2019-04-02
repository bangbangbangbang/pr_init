package com.fld.init.dao;

import com.fld.init.model.TestCre;

public interface TestCreMapper extends ISuperDao<TestCre> {

  TestCre getById(String id);

  int deleteById(String id);

}
