package com.docInventory.jdbc.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.docInventory.jdbc.dto.UpdateQueryDTO;

public class UpdateQueryManager extends JDBCQueryManager {
	
	private Connection connObj;

	public Connection getConnObj() {
		return connObj;
	}

	public void setConnObj(Connection connObj) {
		this.connObj = connObj;
	}

	public UpdateQueryManager(String query) {
		super(query);
	}
	
	public void setQuery(String query) {
		super.setQuery(query);
	}
	
	public static UpdateBatchProcess getBatchProcessObj(String query) {
		return new UpdateBatchProcess(query);
	}
	
	public static class UpdateBatchProcess extends JDBCQueryManager{
		private Connection connObj;
		private PreparedStatement stmt;
		
		public Connection getConnObj() {
			return connObj;
		}

		public void setConnObj(Connection connObj) {
			this.connObj = connObj;
		}

		private UpdateBatchProcess(String query) {
			super(query);
			
			if(this.connObj == null) {
				try {
					this.connObj = HikariCPDataSourceManager.getConnection();
					this.stmt = this.getPreparedStatement(this.connObj, false);
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					this.cleanUp(true);
				}
			}
		}
		
		public void build() {
			try {
				this.buildParameters(this.connObj, this.stmt);
				this.stmt.addBatch();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		/**
		 * isConnClose true when we need to close the connection or If we need chain then return false
		 * default should be true for close connection
		 * @param isConnClose
		 * @return com.docInventory.dto.UpdateQueryDTO
		 */
		public final int[] getExecute(boolean isConnClose) {
			ResultSet resultSetObj = null;
			
			try {
				
				System.out.println("Update Prepared Statement :\n\t" + this.stmt.toString());
				int[] noOfRowEffectedRowArr = this.stmt.executeBatch();
				
				connObj.commit();
				return noOfRowEffectedRowArr;
			} catch (SQLException se) {
				se.printStackTrace();
				// If there is an error then rollback the changes.
				System.out.println("Rolling back data here....");
				try {
					if (connObj != null)
						connObj.rollback();
				} catch (SQLException se2) {
					se2.printStackTrace();
					return null;
				} finally {
					isConnClose = true;
				}
				
				return null;
			} finally {
				try {
					if (resultSetObj != null)
						resultSetObj.close();
					System.out.println("Closed Result Set");
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				this.cleanUp(isConnClose);
			}
		}

		private void cleanUp(boolean isConnClose) {
			try {
				if (this.stmt != null)
					this.stmt.close();
				System.out.println("Closed Statement");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			try {
				if (this.connObj != null  && isConnClose == true) {
					this.connObj.setAutoCommit(true);
					this.connObj.close();
					this.connObj = null;
				}
				System.out.println("Closed Connection");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
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
