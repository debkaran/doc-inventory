package com.docInventory.util;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

public class JDBCQueryManager {
	private String query;
	private Object[] params;

	public JDBCQueryManager(String query, Object... params) {
		this.query = query;
		this.params = params;
	}
	
	public void setQueryAndParameters(String query, Object... params) {
		this.query = query;
		this.params = params;
	}

	protected final PreparedStatement buildStatement(Connection connObj, boolean isSelectQuery) throws SQLException {
		PreparedStatement prepStmtObj = null;
		if(isSelectQuery == false) {
			prepStmtObj = connObj.prepareStatement(this.query, Statement.RETURN_GENERATED_KEYS);
		} else {
			prepStmtObj = connObj.prepareStatement(this.query);
		}
		
		if (params != null && params.length > 0) {
			for (int i = 0; i < params.length; i++) {
				Object param = params[i];
				determineObjectAndSetType(connObj, prepStmtObj, i+1, param);
			}
		}

		return prepStmtObj;
	}

	private final void determineObjectAndSetType(Connection connObj, PreparedStatement prepStmtObj, int index, Object param)
			throws SQLException {
		if (param.getClass() == Integer.class) {
			prepStmtObj.setInt(index, (Integer) param);
		} else if (param.getClass() == String.class) {
			prepStmtObj.setString(index, (String) param);
		} else if (param.getClass() == Float.class) {
			prepStmtObj.setFloat(index, (Float) param);
		} else if (param.getClass() == Double.class) {
			prepStmtObj.setDouble(index, (Double) param);
		} else if (param.getClass() == Date.class) {
			prepStmtObj.setTimestamp(index, new Timestamp(((Date) param).getTime()));
		} else if (param.getClass().isArray()) {
			Object[] objects = (Object[]) param;
			Array array = connObj.createArrayOf("VARCHAR", objects);
			prepStmtObj.setArray(index, array);
		} else {
			prepStmtObj.setObject(index, param);
		}
	}
}
