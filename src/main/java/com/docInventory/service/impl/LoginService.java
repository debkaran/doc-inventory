package com.docInventory.service.impl;

import java.sql.SQLException;

import com.docInventory.dao.UserDetailsDao;
import com.docInventory.dao.impl.UserDetailsDaoImpl;
import com.docInventory.dto.UserDTO;
import com.docInventory.entity.UserDetailsEntity;

public class LoginService {
	private UserDetailsDao userDetailsDao = new UserDetailsDaoImpl();
	
	public UserDTO getUserDetailsByEmailidPassword(String email, String password) {
		UserDTO user = null;
		try {
			UserDetailsEntity userDetailsEntity = userDetailsDao.getUserByEmail(email);
			if(userDetailsEntity != null) {
				if(userDetailsEntity.getPassword().equals(password)) {
					if(userDetailsEntity.getIsActive() == true) {
						user = new UserDTO();
						user.setId(userDetailsEntity.getId());
						user.setName(userDetailsEntity.getName());
						user.setRole(userDetailsEntity.getRole());
						user.setProfilePicture(userDetailsEntity.getProfilePicture());
						user.setStorageSpace(userDetailsEntity.getStorageSpace());
						user.setDateOfBirth(userDetailsEntity.getDob());
						user.setCreatedDate(userDetailsEntity.getCreatedDate());
						user.setLastLoginTime(userDetailsEntity.getLastLoginTime());
						updateFailureLogin(false, userDetailsEntity.getId());
					} else {
						updateFailureLogin(true, userDetailsEntity.getId());
						throw new IllegalStateException("Your account is Inactive.");
					}
				} else {
					updateFailureLogin(true, userDetailsEntity.getId());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public void updateFailureLogin(boolean isFailure, Integer userId) {
		if(isFailure == true) {
			userDetailsDao.updateOnFailureLogin(userId);
		} else {
			userDetailsDao.updateOnSuccessLogin(userId);
		}
	}
}
