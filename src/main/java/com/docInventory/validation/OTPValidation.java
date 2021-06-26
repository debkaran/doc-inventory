package com.docInventory.validation;

import java.sql.SQLException;

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
				throw new IllegalArgumentException("OTP already Used");
			}
			
			return true;
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage());
		}
	}
	
	
	public boolean validateResendRequest(String userId, String sourcePage) {
		if (StringUtils.isEmpty(userId)) {
			throw new IllegalArgumentException("Invalid User");
		} else if (StringUtils.isEmpty(sourcePage)) {
			throw new IllegalArgumentException("Source is invalid");
		}
		
		try {
			UserOTPDetailsEntity userOTPDetails = userOTPDetailsDao
					.getUserOTPDetailsByUserIdAndSourcePage(userId, sourcePage);
			if(userOTPDetails == null) {
				throw new IllegalArgumentException("Invalid User");
			}
			
			return true;
		} catch (SQLException e) {
			throw new IllegalArgumentException(e.getMessage());
		}
	}
}
