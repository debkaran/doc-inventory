package com.docInventory.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.docInventory.dto.UserDTO;
import com.docInventory.util.SelectQueryManager;

public class LoginService {
	public UserDTO getUserDetailsByEmailidPassword(String email, String password) {
		UserDTO user = null;
		
		String query = "select * from user_details where email = ? AND password = ?";
		SelectQueryManager<UserDTO> queryManager = new SelectQueryManager<>(query, email, password) {
			@Override
			protected UserDTO prepareData(ResultSet rs) throws SQLException {
				UserDTO user = null;
				if (rs.next()) {
					user = new UserDTO();
					user.setName(rs.getString("name"));
					user.setRole(rs.getString("role"));
					user.setProfilePicture(rs.getString("profile_picture"));
					user.setStorageSpace(rs.getFloat("storage_space"));
					user.setDateOfBirth(rs.getDate("dob"));
					user.setCreatedDate(rs.getDate("created_date"));
					user.setLastLoginTime(rs.getTimestamp("last_login_time"));
				}
				
				return user;
			}
		};
		
		try {
			user = queryManager.getResultFromSelection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
