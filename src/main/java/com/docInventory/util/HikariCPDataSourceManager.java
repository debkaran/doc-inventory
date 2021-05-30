package com.docInventory.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class HikariCPDataSourceManager {
	private static final String CONFIG_FILE = "database.properties";
	private static HikariConfig config;
	private static HikariDataSource ds;
	static HttpServletRequest request;

	private static Properties loadDBProperty() throws IOException  {
		Properties properties = new Properties();
		// Loading properties file from classpath
		ClassLoader loader = Thread.currentThread().getContextClassLoader();
		try(InputStream resourceStream = loader.getResourceAsStream(CONFIG_FILE)) {
			properties.load(resourceStream);
		}
		return properties;
	}

	static {
		try {
			config = new HikariConfig(loadDBProperty());
			ds = new HikariDataSource(config);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}

	private HikariCPDataSourceManager() {
	}
}