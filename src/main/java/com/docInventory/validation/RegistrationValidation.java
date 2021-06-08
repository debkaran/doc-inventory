package com.docInventory.validation;

import com.docInventory.dto.UserDTO;

public class RegistrationValidation {
	public boolean validate(UserDTO userDTO) {
		if (userDTO.getName() == null || userDTO.getEmail() == null || userDTO.getPassword() == null
				|| userDTO.getDateOfBirth() == null || userDTO.getAgree() == null) {
			 
		}
		
		return false;
	}
}
