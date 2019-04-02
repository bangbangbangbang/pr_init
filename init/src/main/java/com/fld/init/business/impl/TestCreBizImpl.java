package com.fld.init.business.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.fld.framework.constant.RespStatus;
import com.fld.framework.entity.BaseList;
import com.fld.framework.entity.BaseResp;
import com.fld.init.business.inf.TestCreBiz;
import com.fld.init.dao.TestCreMapper;
import com.fld.init.model.TestCre;
import com.fld.init.model.dto.testcre.TestCreReq;


@Service
public class TestCreBizImpl implements TestCreBiz {

  @Resource
  private TestCreMapper testCreMapper;

  @Override
  public List<TestCre> listOnlyTestCre(TestCreReq req) {
    return testCreMapper.findList(req.toMap());
  }

  @Override
  public BaseList<TestCre> listTestCre(TestCreReq req) {

    BaseList<TestCre> result = null;

    if (req == null) {
      return result;
    }


    result = new BaseList<TestCre>(req);
    result.setTotalRows(testCreMapper.count(req.toMap()));

    if (result.getTotalRows() > 0) {
      result.setList(testCreMapper.findList(req.toMap()));
    }

    return result;
  }

  @Override
  @Transactional
  public BaseResp createTestCre(TestCreReq req) {

    BaseResp result = new BaseResp();

    if (req == null) {
      return result.putStatus(RespStatus.PARAMS_VALID_ERROR);
    }

    int r = testCreMapper.save(req.toTestCre());
    if (r > 0) {
      result.success();
    } else {
      result.error();
    }
    return result;
  }

  @Override
  @Transactional
  public BaseResp createTestCre(TestCre testCre) {

    BaseResp result = new BaseResp();

    if (testCre == null) {
      return result.putStatus(RespStatus.PARAMS_VALID_ERROR);
    }

    int r = testCreMapper.save(testCre);
    if (r > 0) {
      result.success();
    } else {
      result.error();
    }
    return result;
  }

  @Override
  @Transactional
  public BaseResp modifyTestCre(TestCreReq req) {

    BaseResp result = new BaseResp();

    if (req == null) {
      return result.putStatus(RespStatus.PARAMS_VALID_ERROR);
    }

    TestCre testCre = testCreMapper.getById(req.getId());

    if (testCre == null) {
      result.putStatus(RespStatus.RECORD_NOT_FOUND);
      return result;
    }

    int r = testCreMapper.update(req.toTestCre());
    if (r > 0) {
      result.success();
    } else {
      result.error();
    }
    return result;
  }

  @Override
  @Transactional
  public BaseResp modifyTestCre(TestCre testCre) {

    BaseResp result = new BaseResp();

    if (testCre == null) {
      return result.putStatus(RespStatus.PARAMS_VALID_ERROR);
    }

    TestCre testCreTemp = testCreMapper.getById(testCre.getId());

    if (testCreTemp == null) {
      result.putStatus(RespStatus.RECORD_NOT_FOUND);
      return result;
    }

    int r = testCreMapper.update(testCre);
    if (r > 0) {
      result.success();
    } else {
      result.error();
    }
    return result;
  }


  @Override
  @Transactional
  public boolean deleteById(String id) {

    boolean result = false;

    if (null == id) {
      return result;
    }

    int delRes = testCreMapper.deleteById(id);
    if (delRes > 0) {
      result = true;
    }
    return result;
  }


  @Override
  public TestCre getById(String id) {

    TestCre result = null;

    if (null == id) {
      return result;
    }

    result = testCreMapper.getById(id);

    return result;
  }


  @Override
  public long count(TestCreReq req) {

    if (req == null) {
      return 0;
    }

    return testCreMapper.count(req.toMap());

  }


}
