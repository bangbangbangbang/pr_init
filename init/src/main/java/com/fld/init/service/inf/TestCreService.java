package com.fld.init.service.inf;


import com.fld.framework.entity.BaseList;
import com.fld.framework.entity.ServiceResult;
import com.fld.init.model.dto.testcre.TestCreReq;
import com.fld.init.model.dto.testcre.TestCreResp;

public interface TestCreService {

  ServiceResult<TestCreResp> getTestCre(TestCreReq req);

  ServiceResult<BaseList<TestCreResp>> getTestCreList(TestCreReq req);

}
