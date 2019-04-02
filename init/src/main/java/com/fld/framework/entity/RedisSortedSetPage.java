package com.fld.framework.entity;

import java.io.Serializable;

/**
 * 分页数据对象
 * 
 * @author zhaokuner
 *
 */
public class RedisSortedSetPage implements Serializable {

	private static final long serialVersionUID = 4166146415467286558L;

	/** 页码 */
	protected long pageIndex = 1;
	/** 单页条数 */
	protected long pageSize = 10;
	/** 分页标识 */
	protected String pageMark;
	/** 开始条数 */
	protected long beginIndex = 0;
	/** 结束条数 */
	protected long endIndex = pageSize - 1;

	private final long defaultPageSize = 10;
	/** 数据排序 */
	private String order;

	public static final String ORDER_ASC = "asc";
	public static final String ORDER_DESC = "desc";

	public RedisSortedSetPage setOrderAsc() {
		this.order = ORDER_ASC;
		return this;
	}

	public RedisSortedSetPage setOrderDesc() {
		this.order = ORDER_DESC;
		return this;
	}

	public boolean isOrderDesc() {
		return ORDER_DESC.equals(this.order);
	}

	private RedisSortedSetPage(long pageIndex, long pageSize, String pageMark) {
		this.pageIndex = pageIndex > 0 ? pageIndex : 1;
		this.pageSize = pageSize > 0 ? pageSize : defaultPageSize;
		this.pageMark = pageMark;
		this.beginIndex = (this.pageIndex - 1) * this.pageSize;
		this.endIndex = this.pageSize * this.pageIndex - 1;
	}

	public static RedisSortedSetPage newInstance(long pageIndex, long pageSize, String pageMark) {
		return new RedisSortedSetPage(pageIndex, pageSize, pageMark);
	}

	public static RedisSortedSetPage newInstance(long pageIndex, long pageSize) {
		return newInstance(pageIndex, pageSize, null);
	}

	public static RedisSortedSetPage newInstance(BaseReq req) {
		return newInstance(req.getPageIndex(), req.getPageSize());
	}

	public long getPageSize() {
		return pageSize;
	}

	public long getPageIndex() {
		return pageIndex;
	}

	public String getPageMark() {
		return pageMark;
	}

	public long getBeginIndex() {
		return beginIndex;
	}

	public long getEndIndex() {
		return endIndex;
	}

}
