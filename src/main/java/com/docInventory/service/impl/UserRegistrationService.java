package com.docInventory.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.docInventory.dao.UserDetailsDao;
import com.docInventory.dao.UserOTPDetailsDao;
import com.docInventory.dao.impl.UserDetailsDaoImpl;
import com.docInventory.dao.impl.UserOTPDetailsDaoImpl;
import com.docInventory.dto.UserDTO;
import com.docInventory.entity.UserDetailsEntity;
import com.docInventory.entity.UserOTPDetailsEntity;
import com.docInventory.util.EmailUtil;
import com.docInventory.util.ServletRequestUtil;
import com.docInventory.validation.RegistrationValidation;

public class UserRegistrationService {
	private RegistrationValidation registrationValidation = new RegistrationValidation();
	private UserDetailsDao userDetailsDao = new UserDetailsDaoImpl();
	private UserOTPDetailsDao userOTPDetailsDao = new UserOTPDetailsDaoImpl();

	public Integer registration(HttpServletRequest request, UserDTO user) {
		Integer fromSelection = null;
		if (registrationValidation.validate(user)) {
			try {
				fromSelection = userDetailsDao.registerUserDetails(ServletRequestUtil.getTotalRootUrl(request), user);
				System.out.println("Inserted with Id " + fromSelection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return fromSelection;
	}

	public void generateOTPForProfileActivation(ServletContext context, Integer userId, String email, String link, String otp) {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("randomString", otp);
			paramMap.put("link", link);
			EmailUtil.sendMailWithTemplate(context, email, "doc-inventory Profile Activation", null,
					"registration-confirmation.html", paramMap);
	}

	public UserDTO getUserDetailsByUserId(String userId) {
		UserDTO user = null;
		try {
			UserDetailsEntity userDetailsEntity = userDetailsDao.getUserByUserId(userId);
			if(userDetailsEntity != null) {
				user = new UserDTO();
				user.setId(userDetailsEntity.getId());
				user.setName(userDetailsEntity.getName());
				user.setEmail(userDetailsEntity.getEmail());
				user.setRole(userDetailsEntity.getRole());
				user.setProfilePicture(userDetailsEntity.getProfilePicture());
				user.setStorageSpace(userDetailsEntity.getStorageSpace());
				user.setDateOfBirth(userDetailsEntity.getDob());
				user.setCreatedDate(userDetailsEntity.getCreatedDate());
				user.setLastLoginTime(userDetailsEntity.getLastLoginTime());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean isOtpUsed(Integer otpId) throws Exception {
		UserOTPDetailsEntity otpDetailsEntity = userOTPDetailsDao.getUserOTPDetailsById(otpId);
		if(otpDetailsEntity.getIsUsed()  || otpDetailsEntity.getIsDelete()) {
			throw new IllegalAccessException("OTP is already used");
		} else {
			return false;
		}
	}
}
