package com.docInventory.validation;

import java.sql.SQLException;

import com.docInventory.constants.OtpConstant;
import com.docInventory.dao.UserOTPDetailsDao;
import com.docInventory.dao.impl.UserOTPDetailsDaoImpl;
import com.docInventory.dto.UserOTPDto;
import com.docInventory.entity.UserOTPDetailsEntity;
import com.docInventory.util.StringUtils;

public class OTPValidation {
	private UserOTPDetailsDao userOTPDetailsDao = new UserOTPDetailsDaoImpl();

	public boolean isValidateOTP(UserOTPDto otpDto) {
		if (StringUtils.isEmpty(otpDto.getOtp())) {
			throw new IllegalArgumentException("Otp should not be Empty");
		}

		try {
			UserOTPDetailsEntity userOTPDetails = userOTPDetailsDao
					.getUserOTPDetailsByUserIdAndSourcePage(String.valueOf(otpDto.getUserId()), otpDto.getSourcePage());
			if(userOTPDetails == null) {
				throw new IllegalArgumentException("Please enter valid OTP");
			}
			if(!userOTPDetails.getOtp().equals(otpDto.getOtp())) {
				throw new IllegalArgumentException("Invalid OTP, Please enter valid OTP");
			}
			if(userOTPDetails.getIsUsed()) {
				throw new IllegalArgumentException("OTP already Used, Please login");
			}
			if(userOTPDetails.getIsExpired() == true){
				throw new IllegalArgumentException("OTP has expired, Please click resend to get new OTP");
			}
			return true;
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	
	public boolean validateResendRequest(UserOTPDto otpDto) {
		if (otpDto.getUserId() == null) {
			throw new IllegalArgumentException("Invalid User");
		} else if (StringUtils.isEmpty(otpDto.getSourcePage())) {
			throw new IllegalArgumentException("Source is invalid");
		}
		
		try {
			UserOTPDetailsEntity userOTPDetails = userOTPDetailsDao
					.getUserOTPDetailsByUserIdAndSourcePage(String.valueOf(otpDto.getUserId()), otpDto.getSourcePage());
			if(userOTPDetails == null) {
				if(otpDto.getSourcePage().equals(OtpConstant.REGISTRATION)) {
					//If source page is registration
					throw new IllegalArgumentException("User is already created");
				} else {
					//If source page is forget password
					throw new IllegalArgumentException("OTP is already verified");
				}
				
			}
			
			return true;
		} catch (SQLException e) {
			throw new IllegalArgumentException(e.getMessage());
		}
	}
}
