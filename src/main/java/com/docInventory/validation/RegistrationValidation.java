package com.docInventory.validation;

import java.sql.SQLException;

import com.docInventory.dao.UserDetailsDao;
import com.docInventory.dao.impl.UserDetailsDaoImpl;
import com.docInventory.dto.UserDTO;
import com.docInventory.entity.UserDetailsEntity;

public class RegistrationValidation {
	private UserDetailsDao userDetails = new UserDetailsDaoImpl();
	
	public boolean validate(UserDTO userDTO) {
		if (userDTO.getName() == null || userDTO.getEmail() == null || userDTO.getPassword() == null
				|| userDTO.getDateOfBirth() == null || userDTO.getAgree() == null) {
			 throw new IllegalArgumentException("Please fill all fields");
		}
		if(!userDTO.getAgree().equals("agree")) {
			throw new IllegalArgumentException("You have to accept the aggrement.");
		}
		
		
		try {
			UserDetailsEntity userDetailsEntity = userDetails.getUserByEmail(userDTO.getEmail());
			if(userDetailsEntity != null){
				throw new IllegalArgumentException("* This email is already registered.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return true;
	}
}
