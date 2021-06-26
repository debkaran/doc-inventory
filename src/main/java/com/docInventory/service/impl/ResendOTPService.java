package com.docInventory.service.impl;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.docInventory.dto.UserDTO;
import com.docInventory.validation.OTPValidation;

public class ResendOTPService {
	private final OTPValidation otpValidation = new OTPValidation();
	private final UserOTPService userOTPService = new UserOTPService();
	private final UserRegistrationService registrationService = new UserRegistrationService();
	
	public boolean validateAndResendOTP(String otpPageUrl, ServletContext context, HttpServletRequest request, String userId, String sourcePage) {
		if(otpValidation.validateResendRequest(userId, sourcePage)) {
			UserDTO userDetails = registrationService.getUserDetailsByUserId(userId);
			userOTPService.sendOtpToEmail(otpPageUrl, context, request, userDetails);
			return true;
		}
		
		return false;
	}
}
