package com.docInventory.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.constants.URIConstant;
import com.docInventory.dto.UserOTPDto;
import com.docInventory.service.impl.ResendOTPService;
import com.docInventory.util.AES256;
import com.docInventory.util.StringUtils;

@WebServlet(URIConstant.RESEND_OTP)
public class ResendOtpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ResendOTPService resendOTPService = new ResendOTPService();
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String sourcePage = request.getParameter("sourcePage");
		
		try {
			String encryptedID = AES256.encrypt(userId);
			StringBuffer otpPageUrlBuilder = new StringBuffer(URIConstant.EMAIL_OTP);
			otpPageUrlBuilder.append("?eUId=").append(StringUtils.uriEncodeValue(encryptedID))
					.append("&srcP=" + sourcePage);
			UserOTPDto otpDto = new UserOTPDto();
			otpDto.setUserId(Integer.valueOf(userId));
			otpDto.setSourcePage(sourcePage);
			resendOTPService.validateAndResendOTP(otpPageUrlBuilder, getServletContext(), request, otpDto);
			response.getWriter().write("Success");
		} catch (Exception e) {
			response.getWriter().write("Error: "+e.getMessage());
		}
	}

}
