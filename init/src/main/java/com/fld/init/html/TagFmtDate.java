package com.fld.init.html;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TagFmtDate extends SimpleTagSupport {
	private String value;
	private String type;
	private String from;
	private String to;

	protected static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	protected static final String TYPE_LONG = "long";
	protected static final String TYPE_STRING = "string";

	@Override
	public void doTag() throws JspException, IOException {
		if (null == value || value.isEmpty())
			return;
		value = value.trim();
		if (null == to || to.isEmpty())
			to = DATE_TIME_FORMAT;
		if (null == from || from.isEmpty())
			from = DATE_TIME_FORMAT;
		try {
			if (null != type && !type.isEmpty()) {
				if (TYPE_LONG.equalsIgnoreCase(type)) {
					fmtLong();
				} else if (TYPE_STRING.equalsIgnoreCase(type)) {
					fmtString();
				}
			} else {
				fmtLong();
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		this.getJspContext().getOut().print(value);
	}

	private void fmtLong() {
		Long date = Long.valueOf(value);
		SimpleDateFormat sdf = new SimpleDateFormat(to);
		// 是否单位是秒
		if (value.length() == 10) {
			date = date * 1000;
		}
		value = sdf.format(new Date(date));
	}

	private void fmtString() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(from);
		Date date = sdf.parse(value);
		SimpleDateFormat sdfto = new SimpleDateFormat(to);
		value = sdfto.format(date);
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}
}
