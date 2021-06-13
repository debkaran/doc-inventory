package com.docInventory.jdbc.util;

import java.io.InputStream;
import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.docInventory.jdbc.dto.SqlParamDTO;

public class SPJDBCQueryManager extends ParamBuilder {
	private String query;

	public SPJDBCQueryManager(String query) {
		this.query = query;
	}

	public void setQuery(String query) {
		this.query = query;
		this.setParams(new ArrayList<>());
		this.setOutParamTypes(new int[] {});
	}

	protected final CallableStatement buildStatement(Connection connObj) throws SQLException {
		CallableStatement cStmtObj = this.getPreparedStatement(connObj);
		this.buildParameters(connObj, cStmtObj);
		
		return cStmtObj;
	}

	protected void buildParameters(Connection connObj, CallableStatement cStmtObj) throws SQLException {
		List<SqlParamDTO> params = this.getParams();
		int length = params.size();
		if (params != null && length > 0) {
			for (int i = 0; i < length; i++) {
				SqlParamDTO param = params.get(i);
				determineObjectAndSetType(connObj, cStmtObj, i + 1, param);
			}
		}
		this.setParams(new ArrayList<>());

		int[] outParamTypes = this.getOutParamTypes();
		if (outParamTypes != null) {
			for (int i = 0; i < outParamTypes.length; i++) {
				int type = outParamTypes[i];
				determineOutParamAndSetType(cStmtObj, (i + 1) + length, type);
			}
		}
		this.setOutParamTypes(new int[] {});
	}

	protected CallableStatement getPreparedStatement(Connection connObj) throws SQLException {
		return connObj.prepareCall(this.query);
	}

	private final void determineObjectAndSetType(Connection connObj, CallableStatement cStmtObj, int index,
			SqlParamDTO param) throws SQLException {
		switch (param.getParamType()) {
			case "Integer":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.INTEGER);
				} else {
					cStmtObj.setInt(index, (Integer) param.getParam());
				}
				break;
	
			case "Long":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.INTEGER);
				} else {
					cStmtObj.setLong(index, (Long) param.getParam());
				}
				break;
			case "String":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.VARCHAR);
				} else {
					cStmtObj.setString(index, String.valueOf(param.getParam()));
				}
				break;
			case "Float":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.FLOAT);
				} else {
					cStmtObj.setFloat(index, (Float) param.getParam());
				}
				break;
			case "Double":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.DOUBLE);
				} else {
					cStmtObj.setDouble(index, (Float) param.getParam());
				}
				break;
			case "Boolean":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.BOOLEAN);
				} else {
					cStmtObj.setBoolean(index, (Boolean) param.getParam());
				}
				break;
			case "Date":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.DATE);
				} else {
					cStmtObj.setTimestamp(index, new Timestamp(((Date) param.getParam()).getTime()));
				}
				break;
			case "Integer[]": case "Long[]":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("INT", objects);
					cStmtObj.setArray(index, array);
				}
				break;
	
			case "String[]":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("VARCHAR", objects);
					cStmtObj.setArray(index, array);
				}
				break;
			case "Float[]":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("FLOAT", objects);
					cStmtObj.setArray(index, array);
				}
				break;
			case "Double[]":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.ARRAY);
				} else {
					Object[] objects = (Object[]) param.getParam();
					Array array = connObj.createArrayOf("DOUBLE", objects);
					cStmtObj.setArray(index, array);
				}
				break;
			case "Object":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.OTHER);
				} else {
					cStmtObj.setObject(index, param.getParam());
				}
				break;
			case "InputStream":
				if (param.getParam() == null) {
					cStmtObj.setNull(index, Types.BINARY);
				} else {
					cStmtObj.setBinaryStream(1, (InputStream) param.getParam(), param.getLength());
				}
				break;
		}
	}
	
	private final void determineOutParamAndSetType(CallableStatement cStmtObj, int index,
			int type) throws SQLException {
		cStmtObj.registerOutParameter(index, type);
	}
	
}
