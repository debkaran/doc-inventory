package com.docInventory.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.docInventory.constants.URIConstant;

@WebFilter("/authenticationFilter")
public class AuthenticationFilter implements Filter {
	private ServletContext context;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		this.context.log("Requested Resource::" + uri);

		HttpSession session = req.getSession(false);
		String[] whiteListedUrl = new String[] { URIConstant.LOGIN };
		
		String contextPath = req.getContextPath();
		if(uri.matches(contextPath+"/resources/*.*")) {
			this.context.log("Skip all resources.");
			chain.doFilter(request, response);
		} else if (session == null && !(checkIfUrlEndWithAnyArrayElement(uri, contextPath, whiteListedUrl))) {
			this.context.log("Unauthorized access request.");
			res.sendRedirect(URIConstant.LOGIN);
		} else {
			this.context.log("Skip all whitelisted.");
			chain.doFilter(request, response);
		}
	}
	
	private boolean checkIfUrlEndWithAnyArrayElement(String uri, String contextPath, String[] urlPatterns) {
		for (String urlPattern : urlPatterns) {
			return uri.equals(contextPath+urlPattern);
		}
		return false;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");
	}

}
