package com.fld.init.business.inf;


import java.util.List;
import com.fld.framework.entity.BaseList;
import com.fld.framework.entity.BaseResp;
import com.fld.init.model.TestCre;
import com.fld.init.model.dto.testcre.TestCreReq;

public interface TestCreBiz {

  BaseResp createTestCre(TestCreReq req);

  BaseResp createTestCre(TestCre testCre);


  boolean deleteById(String id);

  TestCre getById(String id);

  BaseResp modifyTestCre(TestCreReq req);

  BaseResp modifyTestCre(TestCre testCre);

  BaseList<TestCre> listTestCre(TestCreReq req);

  List<TestCre> listOnlyTestCre(TestCreReq req);

  long count(TestCreReq req);

}
