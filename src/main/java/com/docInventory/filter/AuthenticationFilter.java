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
import com.docInventory.dto.UserDTO;

@WebFilter("/authenticationFilter")
public class AuthenticationFilter implements Filter {
	private ServletContext context;
	private final String[] whiteListedPage = new String[] { URIConstant.LOGIN, URIConstant.REGISTRATION,
			URIConstant.FORGET_PASSWORD, URIConstant.RECOVER_PASSWORD, URIConstant.PROFILE_IMAGE, URIConstant.EMAIL_OTP,
			URIConstant.RESEND_OTP, URIConstant.ACTIVATION_SUCCESS };

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();
		this.context.log("Requested Resource::" + uri);

		HttpSession session = req.getSession(false);

		String contextPath = req.getContextPath();
		if (uri.matches(contextPath + "/resources/*.*")) {
			chain.doFilter(request, response);
		} else {
			boolean checkIfUrlEndWithAnyArrayElement = checkIfUrlEndWithAnyArrayElement(uri, contextPath,
					this.whiteListedPage);
			if (checkIfUrlEndWithAnyArrayElement) {
				allowRedirection(res, req, chain);
			} else if (session == null && !checkIfUrlEndWithAnyArrayElement) {
				res.sendRedirect("." + URIConstant.LOGIN);
			} else {
				UserDTO user = (UserDTO) session.getAttribute("user");
				if (user == null) {
					session.removeAttribute("user");
					res.sendRedirect("." + URIConstant.LOGIN);
				} else {
					allowRedirection(res, req, chain);
				}
			}
		}
	}

	private void allowRedirection(HttpServletResponse response, HttpServletRequest request, FilterChain chain)
			throws IOException, ServletException {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP
																					// 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0);
		chain.doFilter(request, response);
	}

	private boolean checkIfUrlEndWithAnyArrayElement(String uri, String contextPath, String[] urlPatterns) {
		boolean isMatch = false;
		for (int i = 0; i < urlPatterns.length && isMatch == false; i++) {
			String urlPattern = urlPatterns[i];
			isMatch = uri.equals(contextPath + urlPattern);
		}
		return isMatch;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		this.context = fConfig.getServletContext();
		this.context.log("AuthenticationFilter initialized");
	}

}
