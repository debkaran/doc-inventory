package com.docInventory.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.docInventory.dto.UpdateQueryDTO;

public class UpdateQueryManager extends JDBCQueryManager {
	
	private Connection connObj;

	public Connection getConnObj() {
		return connObj;
	}

	public void setConnObj(Connection connObj) {
		this.connObj = connObj;
	}

	public UpdateQueryManager(String query, Object... params) {
		super(query, params);
	}
	
	public void setParameters(String query, Object... params) {
		super.setQueryAndParameters(query, params);
	}
	
	/**
	 * isConnClose true when we need to close the connection or If we need chain then return false
	 * default should be true for close connection
	 * @param isConnClose
	 * @return com.docInventory.dto.UpdateQueryDTO
	 */
	public final UpdateQueryDTO getExecute(boolean isConnClose) {
		Connection connObj = null;
		PreparedStatement prepStmtObj = null;
		UpdateQueryDTO queryDTO = null;
		ResultSet resultSetObj = null;
		
		try {
			if(this.connObj == null) {
				connObj = HikariCPDataSourceManager.getConnection();
				this.connObj = connObj;
			} else {
				connObj = this.connObj;
			}
			
			connObj.setAutoCommit(false);
			prepStmtObj = this.buildStatement(connObj, false);
			System.out.println("Update Prepared Statement :\n\t" + prepStmtObj.toString());
			queryDTO = new UpdateQueryDTO();
			int noOfRowEffectedRow = prepStmtObj.executeUpdate();
			queryDTO.setNoOfRowEffected(noOfRowEffectedRow);
			resultSetObj = prepStmtObj.getGeneratedKeys();
			if (resultSetObj.next()) {
				queryDTO.setLastGeneretedId(resultSetObj.getInt(1));
			}
			
			connObj.commit();
			return queryDTO;
		} catch (SQLException se) {
			se.printStackTrace();
			// If there is an error then rollback the changes.
			System.out.println("Rolling back data here....");
			try {
				if (connObj != null)
					connObj.rollback();
			} catch (SQLException se2) {
				se2.printStackTrace();
				return queryDTO;
			} finally {
				isConnClose = true;
			}
			
			return queryDTO;
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
				if (connObj != null  && isConnClose == true) {
					connObj.setAutoCommit(true);
					connObj.close();
					this.connObj = null;
				}
				System.out.println("Closed Connection");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
