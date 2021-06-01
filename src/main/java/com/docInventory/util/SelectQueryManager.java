package com.docInventory.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public abstract class SelectQueryManager<T> extends JDBCQueryManager{

	public SelectQueryManager(String query, Object... params) {
		super(query, params);
	}

	public final T getResultFromSelection() throws SQLException {
		Connection connObj = null;
		PreparedStatement prepStmtObj = null;
		ResultSet resultSetObj = null;
		try {
			connObj = HikariCPDataSourceManager.getConnection();
			prepStmtObj = this.buildStatement(connObj, true);
			System.out.println("Select Prepared Statement :\n\t" + prepStmtObj.toString());
			resultSetObj = prepStmtObj.executeQuery();
			return prepareData(resultSetObj);
		} finally {
			try {
				if (resultSetObj != null)
					resultSetObj.close();
				System.out.println("Closed Result Set");
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (prepStmtObj != null)
					prepStmtObj.close();
				System.out.println("Closed Statement");
			} catch (SQLException e) {
				e.printStackTrace();
			}

			try {
				if (connObj != null)
					connObj.close();
				System.out.println("Closed Connection");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	abstract protected T prepareData(ResultSet resultSetObj) throws SQLException;
}
