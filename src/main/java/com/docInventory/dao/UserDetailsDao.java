package com.docInventory.dao;

import java.sql.SQLException;

import com.docInventory.dto.UserDTO;
import com.docInventory.entity.UserDetailsEntity;
import com.docInventory.jdbc.dto.UpdateQueryDTO;

public interface UserDetailsDao {
	UserDetailsEntity getUserByEmail(String email) throws SQLException;

	UserDetailsEntity getUserByUserId(String userId) throws SQLException;
	
	Integer registerUserDetails(String baseUrl, UserDTO user) throws SQLException;

	UpdateQueryDTO activateUser(Integer userId);
	
	UpdateQueryDTO updateOnFailureLogin(Integer userId);
	
	UpdateQueryDTO updateOnSuccessLogin(Integer userId);
}
