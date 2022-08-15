package com.docInventory.jdbc.util;

import java.io.InputStream;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;

import com.docInventory.jdbc.dto.SqlParamDTO;

public class JDBCQueryManager extends ParamBuilder {
	private String query;

	public JDBCQueryManager(String query) {
		this.query = query;
	}

	public void setQuery(String query) {
		this.query = query;
		this.setParams(new ArrayList<SqlParamDTO>());
		this.setOutParamTypes(new int[] {});
	}

	protected final PreparedStatement buildStatement(Connection connObj, boolean isSelectQuery) throws SQLException {
		PreparedStatement prepStmtObj = this.getPreparedStatement(connObj, isSelectQuery);
		this.buildParameters(connObj, prepStmtObj);
		
		return prepStmtObj;
	}

	protected void buildParameters(Connection connObj, PreparedStatement prepStmtObj) throws SQLException {
		int length = params.size();
		if (params != null && length > 0) {
			for (int i = 0; i < length; i++) {
				SqlParamDTO param = params.get(i);
				determineObjectAndSetType(connObj, prepStmtObj, i + 1, param);
			}
		}
		
		this.setParams(new ArrayList<SqlParamDTO>());
	}

	protected PreparedStatement getPreparedStatement(Connection connObj, boolean isSelectQuery) throws SQLException {
		PreparedStatement prepStmtObj = null;
		if (isSelectQuery == false) {
			prepStmtObj = connObj.prepareStatement(this.query, Statement.RETURN_GENERATED_KEYS);
		} else {
			prepStmtObj = connObj.prepareStatement(this.query);
		}
		return prepStmtObj;
	}

	private final void determineObjectAndSetType(Connection connObj, PreparedStatement prepStmtObj, int index,
			SqlParamDTO param) throws SQLException {
		switch (param.getParamType()) {
			case "Integer":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.INTEGER);
				} else {
					prepStmtObj.setInt(index, (Integer) param.getParam());
				}
				break;
	
			case "Long":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.INTEGER);
				} else {
					prepStmtObj.setLong(index, (Long) param.getParam());
				}
				break;
			case "String":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.VARCHAR);
				} else {
					prepStmtObj.setString(index, String.valueOf(param.getParam()));
				}
				break;
			case "Float":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.FLOAT);
				} else {
					prepStmtObj.setFloat(index, (Float) param.getParam());
				}
				break;
			case "Double":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.DOUBLE);
				} else {
					prepStmtObj.setDouble(index, (Float) param.getParam());
				}
				break;
			case "Boolean":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.BOOLEAN);
				} else {
					prepStmtObj.setBoolean(index, (Boolean) param.getParam());
				}
				break;
			case "Date":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.DATE);
				} else {
					prepStmtObj.setTimestamp(index, new Timestamp(((Date) param.getParam()).getTime()));
				}
				break;
			case "Integer[]": case "Long[]":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("INT", objects);
					prepStmtObj.setArray(index, array);
				}
				break;
	
			case "String[]":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("VARCHAR", objects);
					prepStmtObj.setArray(index, array);
				}
				break;
			case "Float[]":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("FLOAT", objects);
					prepStmtObj.setArray(index, array);
				}
				break;
			case "Double[]":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("DOUBLE", objects);
					prepStmtObj.setArray(index, array);
				}
				break;
			case "Object":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.OTHER);
				} else {
					prepStmtObj.setObject(index, param.getParam());
				}
				break;
			case "InputStream":
				if (param.getParam() == null) {
					prepStmtObj.setNull(index, Types.BINARY);
				} else {
					prepStmtObj.setBinaryStream(1, (InputStream) param.getParam(), param.getLength());
				}
				break;
		}
	}
}
