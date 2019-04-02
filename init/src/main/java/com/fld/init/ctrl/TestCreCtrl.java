package com.fld.init.ctrl;


import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fld.framework.dto.api.ApiResp;
import com.fld.init.framework.runtime.ApiHolder;
import com.fld.init.service.inf.TestCreService;

@Controller
@RequestMapping("testCre")
public class TestCreCtrl extends BaseCtrl {

  @Resource
  private TestCreService service;

  @ResponseBody
  @RequestMapping(value = "/getTestCre", method = RequestMethod.GET)
  public String getTestCre() {

    ApiResp result = new ApiResp();
    ApiHolder.setApiResp(result);
    result.setMsg("我是测试测试测试");

    // toJson
    String resultStr = result.toJson();

    return resultStr;
  }


}
