package com.docInventory.service.impl;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.docInventory.constants.OtpConstant;
import com.docInventory.dao.UserDetailsDao;
import com.docInventory.dao.UserOTPDetailsDao;
import com.docInventory.dao.impl.UserDetailsDaoImpl;
import com.docInventory.dao.impl.UserOTPDetailsDaoImpl;
import com.docInventory.dto.UserDTO;
import com.docInventory.dto.UserOTPDto;
import com.docInventory.jdbc.dto.UpdateQueryDTO;
import com.docInventory.util.AES256;
import com.docInventory.util.RandomString;
import com.docInventory.util.ServletRequestUtil;
import com.docInventory.util.StringUtils;
import com.docInventory.validation.OTPValidation;

public class UserOTPService {
	private final OTPValidation otpValidation = new OTPValidation();
	private final UserOTPDetailsDao otpDetailsDao = new UserOTPDetailsDaoImpl();
	private final UserDetailsDao userDetailsDao = new UserDetailsDaoImpl();
	private final UserRegistrationService registrationService = new UserRegistrationService();
	private UserOTPDetailsDao userOTPDetailsDao = new UserOTPDetailsDaoImpl();

	public boolean validateUserOtp(UserOTPDto otpDto) {
		if (otpValidation.isValidateOTP(otpDto)) {
			UpdateQueryDTO updateQueryDTO = otpDetailsDao.updateUserOTPAsUsed(otpDto);
			if (updateQueryDTO != null && updateQueryDTO.getNoOfRowEffected() > 0) {
				updateQueryDTO = userDetailsDao.activateUser(otpDto.getUserId());
				if (updateQueryDTO != null && updateQueryDTO.getNoOfRowEffected() > 0) {
					return true;
				}
			}
		}

		return false;
	}

	public boolean sendOtpToEmail(StringBuffer otpPageUrlBuilder, ServletContext context, HttpServletRequest request, UserDTO user) {
		try {
			String otp = RandomString.getString(6);
			UpdateQueryDTO updateQueryDTO = userOTPDetailsDao.insertUserOTP(user.getId(), OtpConstant.REGISTRATION, otp);
			if(updateQueryDTO != null) {
				String encryptedID = AES256.encrypt(updateQueryDTO.getLastGeneretedId());
				otpPageUrlBuilder.append("&oId=" + StringUtils.uriEncodeValue(encryptedID));
				String activationLink = ServletRequestUtil.getTotalRootUrl(request) + otpPageUrlBuilder.toString();
				// mail send to registered email address
				new Thread() {
					@Override
					public void run() {
						registrationService.generateOTPForProfileActivation(context, user.getId(), user.getEmail(),
								activationLink, otp);
					}
				}.start();
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}
