package com.docInventory.service.impl;

import com.docInventory.dto.UserDTO;
import com.docInventory.validation.RegistrationValidation;

public class UserRegistrationService {
	private RegistrationValidation registrationValidation = new RegistrationValidation();
	
	public boolean registration(UserDTO user){
		if(registrationValidation.validate(user)) {
			
		}
		
		return true;
	}
}
