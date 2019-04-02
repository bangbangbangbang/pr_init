/**
 *
 */
package com.fld.framework.constant;

import java.io.Serializable;
import com.fld.framework.entity.BaseStatus;

public class RespStatus implements Serializable {
	private static final long serialVersionUID = 5827057219169853109L;
	/** 公共响应 */
	/** 200, "操作成功" */
	public static final BaseStatus SUCCESS = new BaseStatus(200, "操作成功");
	/** 201, "操作成功，重复提交" */
	public static final BaseStatus SUCCESS_REDO = new BaseStatus(201, "操作成功，重复提交");
	/** 400, "操作失败" */
	public static final BaseStatus ERROR = new BaseStatus(400, "操作失败");
	/** 401, "操作失败，重复提交" */
	public static final BaseStatus ERROR_REDO = new BaseStatus(401, "操作失败，重复提交");
	/** 403, "请求操作失败" */
	public static final BaseStatus REQ_ERROR = new BaseStatus(403, "请求操作失败");
	/** 404, "没有找到对应信息" */
	public static final BaseStatus NOT_FOUND_ERROR = new BaseStatus(404, "没有找到对应信息");
	/** 405, "重复提交" */
	public static final BaseStatus REPEAT_SUBMIT = new BaseStatus(405, "重复提交");

	/** 500, "系统错误" */
	public static final BaseStatus SYS_ERROR = new BaseStatus(500, "系统错误");
	/** 501, "会话超时" */
	public static final BaseStatus SESSION_TIME_OUT = new BaseStatus(501, "会话超时");
	/** 502, "会话id无效" */
	public static final BaseStatus SID_NOTVALID = new BaseStatus(502, "会话id无效");
	/** 503, "没有初始化" */
	public static final BaseStatus NOT_INIT_ERROR = new BaseStatus(503, "没有初始化");
	/** 504, "通讯失败" */
	public static final BaseStatus REQUEST_FAILURE = new BaseStatus(504, "通讯失败");

	/** 999,"无效的请求参数" */
	public static final BaseStatus PARAMS_VALID_ERROR = new BaseStatus(999, "无效的请求参数");
	/** 998,"无效的服务编号" */
	public static final BaseStatus PARAMS_SERVICE_ID_ERROR = new BaseStatus(998, "无效的服务编号");
	/** 997,"无效的服务访问类型" */
	public static final BaseStatus PARAMS_SERVICE_TYPE_ERROR = new BaseStatus(997, "无效的服务访问类型");

	/** 996,"矢量密钥结果为空" */
	public static final BaseStatus PARAMS_SERVICE_RELATION_ERROR = new BaseStatus(996, "矢量密钥结果为空");
	/** 995,"无效的请求DATA" */
	public static final BaseStatus PARAMS_DATA_NULL = new BaseStatus(995, "无效的请求DATA");

	/** 994,"密钥为空" */
	public static final BaseStatus PARAMS_SERCERT_NULL = new BaseStatus(994, "密钥为空");
	/** 993,"解密失败" */
	public static final BaseStatus PARAMS_DECRYPT_FAIL = new BaseStatus(993, "解密失败");

	/** 992,"接口无权限" */
	public static final BaseStatus SERVER_NO_RIGHT = new BaseStatus(992, "接口无权限");
	/** 991,"接口有权限" */
	public static final BaseStatus SERVER_ACCESS_RIGHT = new BaseStatus(991, "接口有权限");

	/** 990,"接口不存在" */
	public static final BaseStatus SERVER_NO_EXIST = new BaseStatus(990, "接口不存在");
	/** 989,"接口请求失败" */
	public static final BaseStatus REQ_INTERFACE_FAIL = new BaseStatus(989, "接口请求失败");

	/** 988,"接口对象为空" */
	public static final BaseStatus REQ_OBJECT_NULL = new BaseStatus(988, "接口对象为空");
	/** 987,"密钥状态无效" */
	public static final BaseStatus PARAMS_SERCERT_OFF = new BaseStatus(987, "密钥状态无效");

	/** 986,"数据对象不存在" */
	public static final BaseStatus RECORD_NOT_FOUND = new BaseStatus(986, "数据对象不存在");
	/** 985,"时间戳无效" */
	public static final BaseStatus TIMESTAMP_INVALID = new BaseStatus(985, "时间戳无效");
	/** 984,"服务版本为空" */
	public static final BaseStatus PARAMS_SERVICE_VER_ERROR = new BaseStatus(984, "无效的服务版本");
	/** 983,"数据为空" */
	public static final BaseStatus DATA_RECODE_IS_NULL = new BaseStatus(983, "数据为空");
	/** 984,"数据解析失败" */
	public static final BaseStatus DATA_RECODE_RESOLVE_FUILURE = new BaseStatus(984, "数据解析失败");
}
