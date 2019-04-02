package com.fld.init.framework.util;

import java.io.StringWriter;
import com.fld.framework.util.MD5Util;
import freemarker.cache.StringTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateNotFoundException;

public class FreemarkerUtils {

	public static Configuration cfg = new Configuration(Configuration.VERSION_2_3_23);

	public static String format(String template, Object params) {
		try {
			Template t = null;
			try {
				t = cfg.getTemplate(MD5Util.MD5(template));
			} catch (TemplateNotFoundException e) {
				t = initStringTemplateLoader(template);
			}
			if (null == t) {
				t = initStringTemplateLoader(template);
			}
			StringWriter bos = new StringWriter();
			t.process(params, bos);
			return bos.toString();
		} catch (Exception e) {
			LogUtils.error("FreemarkerUtils template:" + template, e);
		}

		return template;
	}

	private static Template initStringTemplateLoader(String template) throws Exception {
		String tid = MD5Util.MD5(template);
		StringTemplateLoader stringLoader = new StringTemplateLoader();
		stringLoader.putTemplate(tid, template);
		cfg.setTemplateLoader(stringLoader);
		return cfg.getTemplate(tid);
	}

}
