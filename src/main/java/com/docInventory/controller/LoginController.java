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
import com.docInventory.dto.UserDTO;
import com.docInventory.service.impl.LoginService;
import com.docInventory.util.HikariCPDataSourceManager;

@WebServlet(URIConstant.LOGIN)
public class LoginController extends HttpServlet {
	private LoginService loginService = new LoginService();

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			Connection connection = HikariCPDataSourceManager.getConnection();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/login.jsp");
		requestDispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserDTO user = loginService.getUserDetailsByEmailidPassword(email, password);

		if (user != null) {
			req.getSession().setAttribute("user", user);
			resp.sendRedirect("."+URIConstant.INVENTORY);
		} else {
			req.setAttribute("errorMessage", "Invalid user id or password");
			RequestDispatcher requestDispatcher = req.getRequestDispatcher("WEB-INF/views/login.jsp");
			requestDispatcher.forward(req, resp);
		}
	}

}
