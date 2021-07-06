package com.docInventory.dao.impl;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.docInventory.constants.URIConstant;
import com.docInventory.dao.UserDetailsDao;
import com.docInventory.dto.UserDTO;
import com.docInventory.entity.UserDetailsEntity;
import com.docInventory.jdbc.dto.UpdateQueryDTO;
import com.docInventory.jdbc.util.SelectQueryManager;
import com.docInventory.jdbc.util.StoreProcedureUpdateManager;
import com.docInventory.jdbc.util.UpdateQueryManager;

public class UserDetailsDaoImpl implements UserDetailsDao {
	
	private UserDetailsEntity buildUserDetailsEntity(ResultSet rs) throws SQLException {
		UserDetailsEntity user = null;
		if (rs.next()) {
			user = new UserDetailsEntity();
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setRole(rs.getString("role"));
			user.setPassword(rs.getString("password"));
			user.setProfilePicture(rs.getString("profile_picture"));
			user.setStorageSpace(rs.getFloat("storage_space"));
			user.setDob(rs.getDate("dob"));
			user.setCreatedDate(rs.getDate("created_date"));
			user.setLastLoginTime(rs.getTimestamp("last_login_time"));
			user.setNoOfFailureLogin(rs.getInt("no_of_failure_login"));
			user.setIsActive(rs.getBoolean("is_active"));
			user.setIsDelete(rs.getBoolean("is_delete"));
		}
		
		return user;
	}

	@Override
	public UserDetailsEntity getUserByEmail(String email) throws SQLException {
		String query = "select * from user_details where email = ? and is_delete is FALSE";
		SelectQueryManager<UserDetailsEntity> queryManager = new SelectQueryManager<UserDetailsEntity>(query) {
			@Override
			protected UserDetailsEntity prepareData(ResultSet rs) throws SQLException {
				return buildUserDetailsEntity(rs);
			}
		};
		queryManager.setParam(email);
		
		return queryManager.getResultFromSelection();
	}

	@Override
	public Integer registerUserDetails(String baseUrl, UserDTO user) throws SQLException {
		// http://localhost:8080/doc-inventory/profile-image?text=T
		String defaultProfilePicture = baseUrl + URIConstant.PROFILE_IMAGE
				+ "?text=" + user.getName().charAt(0);
		user.setProfilePicture(defaultProfilePicture);
		String query = "{call CreateAccount(?, ? ,?, ?, ?, ?)}";
		StoreProcedureUpdateManager<Integer> sp = new StoreProcedureUpdateManager<Integer>(query) {
			@Override
			protected Integer prepareData(CallableStatement statement) throws SQLException {
				return statement.getInt(6);
			}
		};

		sp.setParam(user.getName()).setParam(user.getEmail()).setParam(user.getPassword())
				.setParam(user.getProfilePicture()).setParam(user.getDateOfBirth()).setOutParamTypes(Types.INTEGER);

		return sp.getResultFromSelection();
	}

	@Override
	public UserDetailsEntity getUserByUserId(String userId) throws SQLException {
		String query = "select * from user_details where id = ? and is_delete is FALSE";
		SelectQueryManager<UserDetailsEntity> queryManager = new SelectQueryManager<UserDetailsEntity>(query) {
			@Override
			protected UserDetailsEntity prepareData(ResultSet rs) throws SQLException {
				return buildUserDetailsEntity(rs);
			}
		};
		queryManager
				.setParam(userId);
		
		return queryManager.getResultFromSelection();
	}
	
	@Override
	public UpdateQueryDTO activateUser(Integer userId) {
		String query = "update user_details set is_active = true where id = ?";
		UpdateQueryManager qManager = UpdateQueryManager.getUpdateQueryManagerInstance(query);
		qManager.setParam(userId);
		UpdateQueryDTO updateQueryDTO = qManager.getExecute(true);
		return updateQueryDTO;
	}

	@Override
	public UpdateQueryDTO updateOnFailureLogin(Integer userId) {
		String query = "update user_details set no_of_failure_login = (no_of_failure_login + 1), last_failure_login_time = CURRENT_TIMESTAMP where id = ?";
		UpdateQueryManager qManager = UpdateQueryManager.getUpdateQueryManagerInstance(query);
		qManager.setParam(userId);
		UpdateQueryDTO updateQueryDTO = qManager.getExecute(true);
		return updateQueryDTO;
	}
	
	@Override
	public UpdateQueryDTO updateOnSuccessLogin(Integer userId) {
		String query = "update user_details set no_of_failure_login = 0 where id = ?";
		UpdateQueryManager qManager = UpdateQueryManager.getUpdateQueryManagerInstance(query);
		qManager.setParam(userId);
		UpdateQueryDTO updateQueryDTO = qManager.getExecute(true);
		return updateQueryDTO;
	}
}
