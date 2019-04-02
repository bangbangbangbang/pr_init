package com.fld.init.html;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TagCutoutChar extends SimpleTagSupport {
	private Integer count;
	private String suffix;
	private String value;

	protected static final String DEFAULT = "......";

	@Override
	public void doTag() throws JspException, IOException {
		value = null == value ? "" : value;
		count = null == count ? new Integer(-1) : count;
		suffix = null == suffix ? DEFAULT : suffix;
		this.getJspContext().getOut().print(cutoutChar());
	}

	/**
	 * 截串
	 * 
	 * @param str
	 * @param count
	 *            大于0
	 * @return count若小于等0，则为...
	 */
	public String cutoutChar() {

		if (count <= 0) {
			return value;
		}
		if (value.length() < count) {
			return value;
		}
		return value.substring(0, count).concat(suffix);
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getSuffix() {
		return suffix;
	}

	public void setSuffix(String suffix) {
		this.suffix = suffix;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
