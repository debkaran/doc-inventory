package com.docInventory.jdbc.util;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public abstract class StoreProcedureUpdateManager<T> extends SPJDBCQueryManager{

	public StoreProcedureUpdateManager(String query) {
		super(query);
	}

	public final T getResultFromSelection() throws SQLException {
		Connection connObj = null;
		CallableStatement cStmtObj = null;
		try {
			connObj = HikariCPDataSourceManager.getConnection();
			cStmtObj = this.buildStatement(connObj);
			System.out.println("Select Callable Statement :\n\t" + cStmtObj.toString());
			cStmtObj.executeUpdate();
			return prepareData(cStmtObj);
		} finally {
			try {
				if (cStmtObj != null)
					cStmtObj.close();
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
	
	abstract protected T prepareData(CallableStatement statement) throws SQLException;
}
