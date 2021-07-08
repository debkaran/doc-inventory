package com.docInventory.dao;

import java.sql.SQLException;

import com.docInventory.dto.UserOTPDto;
import com.docInventory.entity.UserOTPDetailsEntity;
import com.docInventory.jdbc.dto.UpdateQueryDTO;

public interface UserOTPDetailsDao {
	UpdateQueryDTO insertUserOTP(Integer userId, String sourcePage, String otp);
	
	UserOTPDetailsEntity getUserOTPDetailsByUserIdAndSourcePage(String userId, String sourcePage) throws SQLException;
	
	UpdateQueryDTO updateUserOTPAsUsed(UserOTPDto otpDto);
	
	UpdateQueryDTO deleteUserOTP(UserOTPDto otpDto);

	UserOTPDetailsEntity getUserOTPDetailsById(Integer otpId) throws SQLException;
}
