package com.docInventory.validation;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.docInventory.dto.UserDTO;
import com.docInventory.jdbc.util.SelectQueryManager;

public class RegistrationValidation {

	public boolean validate(UserDTO userDTO) {
		if (userDTO.getName() == null || userDTO.getEmail() == null || userDTO.getPassword() == null
				|| userDTO.getDateOfBirth() == null || userDTO.getAgree() == null) {
			 throw new IllegalArgumentException("Please fill all fields");
		}
		if(!userDTO.getAgree().equals("agree")) {
			throw new IllegalArgumentException("You have to accept the aggrement.");
		}
		String query = "select email from user_details where email = ?";
		SelectQueryManager<String> qManager = new SelectQueryManager<String>(query) {
			@Override
			protected String prepareData(ResultSet resultSetObj) throws SQLException {
				String email = null;
				if (resultSetObj.next()) {
					email = resultSetObj.getString("email");
				}
				return email;
			}
		};
		qManager.setParam(userDTO.getEmail());
		
		try {
			String email = qManager.getResultFromSelection();
			if(email != null){
				throw new IllegalArgumentException("* This email is already registered.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		return true;
	}
}
