package com.docInventory.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.constants.URIConstant;
import com.docInventory.util.HikariCPDataSourceManager;

@WebServlet(URIConstant.LOGIN)
public class LoginController extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection connection = HikariCPDataSourceManager.getConnection();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		requestDispatcher.forward(request, response);
	}


}
