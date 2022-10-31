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
import com.docInventory.dto.UserOTPDto;
import com.docInventory.service.impl.UserOTPService;
import com.docInventory.service.impl.UserRegistrationService;
import com.docInventory.util.AES256;
import com.docInventory.util.StringUtils;

@WebServlet(URIConstant.EMAIL_OTP)
public class EmailOTPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserRegistrationService registrationService = new UserRegistrationService();
	private final UserOTPService userOTPService = new UserOTPService();
	
	private String errorMsg;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String encUserId = request.getParameter("eUId");
		String sourcePage = request.getParameter("srcP");
		String oId = request.getParameter("oId");
		
		try {
			if (sourcePage == null) {
				throw new IllegalArgumentException("Source Page should not be null");
			} else if (!sourcePage.equals(OtpConstant.REGISTRATION)
					&& !sourcePage.equals(OtpConstant.FORGET_PASSWORD)) {
				throw new IllegalArgumentException("Wrong source page.");
			}

			String otpId = AES256.decrypt(oId);
			try {
				// validate OTP is used
				registrationService.isOtpUsed(Integer.valueOf(otpId));
			} catch(IllegalAccessException ex) {
				this.errorMsg = ex.getMessage();
			}
			String userId = AES256.decrypt(encUserId);
			UserDTO userDetails = registrationService.getUserDetailsByUserId(userId);
			request.setAttribute("sourcePage", sourcePage);
			request.setAttribute("userId", userId);
			request.setAttribute("eUId", encUserId);
			request.setAttribute("userEmail", userDetails.getEmail());
			request.setAttribute("oId", oId);
			if(this.errorMsg != null){
				request.setAttribute("errorMessage", this.errorMsg);
				this.errorMsg = null;
			}
			
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/email-otp.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("." + URIConstant.LOGIN);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String sourcePage = request.getParameter("sourcePage");
		String otp = request.getParameter("otp");
		String eUId = request.getParameter("eUId");
		String oId = (String) request.getParameter("oId");
		UserOTPDto otpDto = new UserOTPDto();
		otpDto.setUserId(Integer.parseInt(userId));
		otpDto.setSourcePage(sourcePage);
		otpDto.setOtp(otp);

		try {
			boolean isValid = userOTPService.validateUserOtp(otpDto);
			if(isValid) {
				if(sourcePage.equals(OtpConstant.REGISTRATION)) {
					//for registration
					response.sendRedirect("." + URIConstant.ACTIVATION_SUCCESS);
				} else {
					//forget password
					response.sendRedirect("." + URIConstant.RECOVER_PASSWORD+ "?eUId=" + StringUtils.uriEncodeValue(eUId));
				}
			} else{
				this.errorMsg = "Somthing went wrong";
				response.sendRedirect(
						"." + URIConstant.EMAIL_OTP + "?eUId=" + StringUtils.uriEncodeValue(eUId) + "&srcP=" + sourcePage + "&oId=" + StringUtils.uriEncodeValue(oId));
			}
		} catch (RuntimeException ex) {
			this.errorMsg = ex.getMessage();
			response.sendRedirect(
					"." + URIConstant.EMAIL_OTP + "?eUId=" + StringUtils.uriEncodeValue(eUId) + "&srcP=" + sourcePage + "&oId=" + StringUtils.uriEncodeValue(oId));
		}
	}
}