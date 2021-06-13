package com.docInventory.service.impl;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.docInventory.constants.URIConstant;
import com.docInventory.dto.UserDTO;
import com.docInventory.jdbc.dto.UpdateQueryDTO;
import com.docInventory.jdbc.util.StoreProcedureUpdate;
import com.docInventory.jdbc.util.UpdateQueryManager;
import com.docInventory.util.EmailUtil;
import com.docInventory.util.RandomString;
import com.docInventory.util.ServletRequestUtil;
import com.docInventory.validation.RegistrationValidation;

public class UserRegistrationService {
	private RegistrationValidation registrationValidation = new RegistrationValidation();

	public Integer registration(HttpServletRequest request, UserDTO user) {
		Integer fromSelection = null;

		if (registrationValidation.validate(user)) {
			// http://localhost:8080/doc-inventory/profile-image?text=T
			String defaultProfilePicture = ServletRequestUtil.getTotalRootUrl(request) + URIConstant.PROFILE_IMAGE
					+ "?text=" + user.getName().charAt(0);
			user.setProfilePicture(defaultProfilePicture);
			String query = "{call CreateAccount(?, ? ,?, ?, ?, ?)}";
			StoreProcedureUpdate<Integer> sp = new StoreProcedureUpdate<Integer>(query) {
				@Override
				protected Integer prepareData(CallableStatement statement) throws SQLException {
					return statement.getInt(6);
				}
			};

			sp.setParam(user.getName()).setParam(user.getEmail()).setParam(user.getPassword())
					.setParam(user.getProfilePicture()).setParam(user.getDateOfBirth()).setOutParamTypes(Types.INTEGER);

			try {
				fromSelection = sp.getResultFromSelection();
				System.out.println("Inserted with Id " + fromSelection);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return fromSelection;
	}

	public void generateOTPForProfileActivation(ServletContext context, Integer userId, String email) {
		String otp = RandomString.getString(6);
		String query = "insert into user_otp_details(user_id, otp) values(?,  ?)";
		UpdateQueryManager qManager = new UpdateQueryManager(query);
		qManager.setParam(userId).setParam(otp);
		UpdateQueryDTO updateQueryDTO = qManager.getExecute(true);
		if (updateQueryDTO != null) {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("randomString", otp);
			paramMap.put("link", "#");
			EmailUtil.sendMailWithTemplate(context, email, "doc-inventory Profile Activation", null,
					"registration-confirmation.html", paramMap);
		}
	}
}
