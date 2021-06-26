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

@WebServlet(URIConstant.EMAIL_OTP)
public class EmailOTPController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final UserRegistrationService registrationService = new UserRegistrationService();
	private final UserOTPService userOTPService = new UserOTPService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String encUserId = request.getParameter("eUId");
		String sourcePage = request.getParameter("srcP");
		
		try {
			if(sourcePage == null) {
				throw new IllegalArgumentException("Source Page should not be null");
			} else if(!sourcePage.equals(OtpConstant.REGISTRATION) && !sourcePage.equals(OtpConstant.FORGET_PASSWORD)) {
				throw new IllegalArgumentException("Wrong source page.");
			}
			
			String userId = AES256.decrypt(encUserId);
			UserDTO userDetails = registrationService.getUserDetailsByUserId(userId);
			request.setAttribute("sourcePage", sourcePage);
			request.setAttribute("userId", userId);
			request.setAttribute("userEmail", userDetails.getEmail());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/email-otp.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("."+URIConstant.LOGIN);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String sourcePage = request.getParameter("sourcePage");
		String otp = request.getParameter("otp");
		UserOTPDto otpDto = new UserOTPDto();
		otpDto.setUserId(Integer.parseInt(userId));
		otpDto.setSourcePage(sourcePage);
		otpDto.setOtp(otp);
		
		
		try {
			userOTPService.validateUserOtp(otpDto);
		}catch(RuntimeException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/email-otp.jsp");
			requestDispatcher.forward(request, response);
		}
		response.sendRedirect("." + URIConstant.ACTIVATION_SUCCESS);
	}
	
}
