package com.docInventory.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.constants.OtpConstant;
import com.docInventory.constants.URIConstant;
import com.docInventory.dto.UserDTO;
import com.docInventory.service.impl.LoginService;
import com.docInventory.service.impl.UserOTPService;
import com.docInventory.util.AES256;
import com.docInventory.util.StringUtils;

@WebServlet(URIConstant.FORGET_PASSWORD)
public class ForgetPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final LoginService loginService = new LoginService();
	private final UserOTPService userOTPService = new UserOTPService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/forget-password.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String email = request.getParameter("email");
			UserDTO user = loginService.getUserDetailsByEmailid(email);
			String userId = String.valueOf(user.getId());
			String encryptedID = AES256.encrypt(userId);
			StringBuffer otpPageUrlBuilder = new StringBuffer(URIConstant.EMAIL_OTP);
			otpPageUrlBuilder.append("?eUId=").append(StringUtils.uriEncodeValue(encryptedID))
					.append("&srcP=" + OtpConstant.FORGET_PASSWORD);
			userOTPService.sendOtpToEmail(otpPageUrlBuilder, getServletContext(), request, user);
			response.sendRedirect("." + otpPageUrlBuilder.toString());
		} catch (Exception e) {
			request.setAttribute("errorMessage", e.getMessage());
			doGet(request, response);
		}
		
	}
}