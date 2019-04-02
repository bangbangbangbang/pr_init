package com.fld.init.framework.dynamic;

import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.SqlCommandType;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import com.fld.framework.util.JacksonUtils;
import com.fld.init.framework.constant.Configuration;

@Intercepts(value = { @Signature(type = Executor.class, method = "query", args = { MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class }), @Signature(type = Executor.class, method = "update", args = { MappedStatement.class, Object.class }) })

public class RWSplitting implements Interceptor {

	JdbcContextHolder jdbcContextHolder;

	@Override
	public Object intercept(Invocation invocation) throws Throwable {

		MappedStatement mappedStatement = (MappedStatement) invocation.getArgs()[0];
		// 本地调试显示sql
		if (Configuration.SYSTEM_PROJECT_LOCAL) {
			try {
				Object parameter = null;
				if (invocation.getArgs().length > 1) {
					parameter = invocation.getArgs()[1];
				}
				BoundSql boundSql = mappedStatement.getBoundSql(parameter);
				System.err.println("--sql-start-----------------------------------------");
				System.err.println(boundSql.getSql());
				System.err.println("--params--------------------------------------------");
				System.err.println(JacksonUtils.toJson(boundSql.getParameterObject()));
				System.err.println("--sql-end--------------------------------------------");
			} catch (Exception e) {
			}
		}
		if (mappedStatement.getSqlCommandType() == SqlCommandType.SELECT) {
			jdbcContextHolder.setSlave();
		} else {
			if (null == jdbcContextHolder.getJdbcType()) {
				jdbcContextHolder.setMaster();
			}
		}
		try {
			Object result = invocation.proceed();
			// 本地调试显示sql
			if (Configuration.SYSTEM_PROJECT_LOCAL) {
				try {
					System.err.println(JacksonUtils.toJson(result));
					System.err.println("--sql-result-----------------------------------------");
				} catch (Exception e) {
				}
			}
			return result;
		} finally {
			jdbcContextHolder.clearJdbcType();
		}
	}

	@Override
	public Object plugin(Object arg0) {
		return Plugin.wrap(arg0, this);
	}

	@Override
	public void setProperties(Properties arg0) {
		System.out.println("set properties!~~");
		System.out.println(arg0);
	}

	public void setJdbcContextHolder(JdbcContextHolder jdbcContextHolder) {
		this.jdbcContextHolder = jdbcContextHolder;
	}

}
