package com.docInventory.service.impl;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.docInventory.dao.UserOTPDetailsDao;
import com.docInventory.dao.impl.UserOTPDetailsDaoImpl;
import com.docInventory.dto.UserDTO;
import com.docInventory.dto.UserOTPDto;
import com.docInventory.validation.OTPValidation;

public class ResendOTPService {
	private final UserOTPDetailsDao userOTPDetailsDao = new UserOTPDetailsDaoImpl();
	private final OTPValidation otpValidation = new OTPValidation();
	private final UserOTPService userOTPService = new UserOTPService();
	private final UserRegistrationService registrationService = new UserRegistrationService();
	
	public boolean validateAndResendOTP(StringBuffer otpPageUrl, ServletContext context, HttpServletRequest request, UserOTPDto otpDto) {
		if(otpValidation.validateResendRequest(otpDto)) {
			UserDTO userDetails = registrationService.getUserDetailsByUserId(String.valueOf(otpDto.getUserId()));
			userOTPDetailsDao.deleteUserOTP(otpDto);
			userOTPService.sendOtpToEmail(otpPageUrl, context, request, userDetails);
			return true;
		}
		
		return false;
	}
}
