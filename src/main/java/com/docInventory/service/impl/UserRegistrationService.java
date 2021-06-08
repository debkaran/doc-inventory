package com.docInventory.service.impl;

import com.docInventory.dto.UserDTO;

public class UserRegistrationService {
	public boolean registration(UserDTO user){
		System.out.println("Agree =>" + user.getAgree());
		
		return true;
	}
}
