package com.docInventory.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.docInventory.dao.UserOTPDetailsDao;
import com.docInventory.dto.UserOTPDto;
import com.docInventory.entity.UserOTPDetailsEntity;
import com.docInventory.jdbc.dto.UpdateQueryDTO;
import com.docInventory.jdbc.util.SelectQueryManager;
import com.docInventory.jdbc.util.UpdateQueryManager;

public class UserOTPDetailsDaoImpl implements UserOTPDetailsDao {

	@Override
	public UpdateQueryDTO insertUserOTP(Integer userId, String sourcePage, String otp) {
		String query = "insert into user_otp_details(user_id, source_page, otp) values(?,  ?,  ?)";
		UpdateQueryManager qManager = UpdateQueryManager.getUpdateQueryManagerInstance(query);
		qManager.setParam(userId).setParam(sourcePage).setParam(otp);
		UpdateQueryDTO updateQueryDTO = qManager.getExecute(true);
		return updateQueryDTO;
	}
	
	@Override
	public UserOTPDetailsEntity getUserOTPDetailsByUserIdAndSourcePage(String userId, String sourcePage) throws SQLException {
		String query = "select * from user_otp_details where user_id = ? and source_page = ? and is_delete is FALSE";
		SelectQueryManager<UserOTPDetailsEntity> queryManager = new SelectQueryManager<UserOTPDetailsEntity>(query) {
			@Override
			protected UserOTPDetailsEntity prepareData(ResultSet rs) throws SQLException {
				UserOTPDetailsEntity otpDetailsEntity = null;
				if (rs.next()) {
					otpDetailsEntity = otpDetailsSetByResultSet(rs);
				}
				
				return otpDetailsEntity;
			}
		};
		queryManager
				.setParam(userId).setParam(sourcePage);
		
		return queryManager.getResultFromSelection();
	}
	
	private UserOTPDetailsEntity otpDetailsSetByResultSet(ResultSet rs) throws SQLException {
		UserOTPDetailsEntity otpDetailsEntity;
		otpDetailsEntity = new UserOTPDetailsEntity();
		otpDetailsEntity.setId(rs.getInt("id"));
		otpDetailsEntity.setUserId(rs.getInt("user_id"));
		otpDetailsEntity.setSourcePage(rs.getString("source_page"));
		otpDetailsEntity.setOtp(rs.getString("otp"));
		otpDetailsEntity.setOtpGenerationDate(rs.getDate("otp_generation_date"));
		otpDetailsEntity.setIsUsed(rs.getBoolean("is_used"));
		otpDetailsEntity.setIsDelete(rs.getBoolean("is_delete"));
		otpDetailsEntity.setIsExpired(rs.getBoolean("is_expired"));
		return otpDetailsEntity;
	}
	
	@Override
	public UpdateQueryDTO updateUserOTPAsUsed(UserOTPDto otpDto) {
		String query = "update user_otp_details set is_used = true, is_delete = true where user_id = ? and source_page = ? and is_delete is false";
		UpdateQueryManager qManager = UpdateQueryManager.getUpdateQueryManagerInstance(query);
		qManager.setParam(otpDto.getUserId()).setParam(otpDto.getSourcePage());
		UpdateQueryDTO updateQueryDTO = qManager.getExecute(false);
		return updateQueryDTO;
	}
	
	@Override
	public UpdateQueryDTO deleteUserOTP(UserOTPDto otpDto) {
		return this.updateUserOTPAsUsed(otpDto);
	}

	@Override
	public UserOTPDetailsEntity getUserOTPDetailsById(Integer otpId) throws SQLException {
		String query = "select * from user_otp_details where id = ?";
		SelectQueryManager<UserOTPDetailsEntity> queryManager = new SelectQueryManager<UserOTPDetailsEntity>(query) {
			@Override
			protected UserOTPDetailsEntity prepareData(ResultSet rs) throws SQLException {
				UserOTPDetailsEntity otpDetailsEntity = null;
				if (rs.next()) {
					otpDetailsEntity = otpDetailsSetByResultSet(rs);
				}
				
				return otpDetailsEntity;
			}
		};
		queryManager
				.setParam(otpId);
		
		return queryManager.getResultFromSelection();
	}
}
