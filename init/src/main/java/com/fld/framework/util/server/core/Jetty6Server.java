package com.fld.framework.util.server.core;

import javax.servlet.ServletContext;

public class Jetty6Server extends ServerWrapper {

	public Jetty6Server(ServletContext context) {
		super(context);
	}

	@Override
	protected void extractContext(ServletContext _context) {
		// SContext context = (SContext) _context;
		// Server server = context.getContextHandler().getServer();
		// Connector connector = server.getConnectors()[0];
		//
		// port = connector.getPort();

	}
}
