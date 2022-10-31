package com.docInventory.service.impl;

import com.docInventory.dao.UserDetailsDao;
import com.docInventory.dao.impl.UserDetailsDaoImpl;

public class ForgetPasswordService {
	private UserDetailsDao userDetailsDao = new UserDetailsDaoImpl();

	public boolean getUserDetailsByEmailidPassword(Integer userId, String password) {
		userDetailsDao.updateOnPassword(userId, password);
		return true;
	}
}
