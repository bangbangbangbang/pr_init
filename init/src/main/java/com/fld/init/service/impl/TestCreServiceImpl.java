package com.fld.init.service.impl;


import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fld.framework.constant.RespStatus;
import com.fld.framework.entity.BaseList;
import com.fld.framework.entity.ServiceResult;
import com.fld.init.business.inf.TestCreBiz;
import com.fld.init.model.TestCre;
import com.fld.init.model.dto.testcre.TestCreReq;
import com.fld.init.model.dto.testcre.TestCreResp;
import com.fld.init.service.inf.TestCreService;

@Service
public class TestCreServiceImpl implements TestCreService {

  @Resource
  public TestCreBiz testCreBiz;

  @Override
  public ServiceResult<TestCreResp> getTestCre(TestCreReq req) {

    ServiceResult<TestCreResp> result = new ServiceResult<TestCreResp>();

    if (req == null) {
      return result.error(RespStatus.PARAMS_VALID_ERROR);
    }

    String id = req.getId();
    if (null == id) {
      return result.error(RespStatus.PARAMS_VALID_ERROR);
    }

    TestCre testCre = testCreBiz.getById(id);
    if (testCre == null) {
      return result.error(RespStatus.RECORD_NOT_FOUND);
    }

    return result.success(new TestCreResp(testCre));
  }

  public ServiceResult<BaseList<TestCreResp>> getTestCreList(TestCreReq req) {

    ServiceResult<BaseList<TestCreResp>> result = new ServiceResult<BaseList<TestCreResp>>();

    if (req == null) {
      return result.error(RespStatus.PARAMS_VALID_ERROR);
    }


    BaseList<TestCre> baseList = testCreBiz.listTestCre(req);

    if (baseList == null) {
      return result.error(RespStatus.RECORD_NOT_FOUND);
    }

    List<TestCreResp> list = new ArrayList<TestCreResp>();
    if (baseList.getList() != null && baseList.getList().size() > 0) {
      for (TestCre temp : baseList.getList()) {
        if (temp == null) {
          continue;
        }
        list.add(new TestCreResp(temp));
      }
    }

    BaseList<TestCreResp> testCreList = new BaseList<TestCreResp>();
    testCreList.setList(list);
    testCreList.initPageInfo(baseList);

    return result.success(testCreList);
  }

}
