package com.fld.framework.dto.api;

import java.io.Serializable;
import com.fld.framework.util.JacksonUtils;

/**
 * 请求返回数据父类
 * 
 *
 */
public class ApiResolveRespData implements Serializable {

	private static final long serialVersionUID = -1290046396752366884L;
	private int totalRows;
	private int totalPage;
	private String pageMark;

	public String toJson() {
		return JacksonUtils.toJson(this);
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public String getPageMark() {
		return pageMark;
	}

	public void setPageMark(String pageMark) {
		this.pageMark = pageMark;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

}
