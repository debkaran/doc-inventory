package com.docInventory.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.constants.URIConstant;
import com.docInventory.service.impl.ForgetPasswordService;
import com.docInventory.util.AES256;

@WebServlet(URIConstant.RECOVER_PASSWORD)
public class RecoverPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ForgetPasswordService forgetPasswordService = new ForgetPasswordService();
	private String encUID;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String encUserId = request.getParameter("eUId");
		if(encUserId == null) {
			encUserId = this.encUID;
			this.encUID = null;
		}
		try {
			request.setAttribute("encUserId", encUserId);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/recover-password.jsp");
			requestDispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String encUserId = request.getParameter("eUId");
		if(password.equals(confirmPassword)) {
			try {
				String userId = AES256.decrypt(encUserId);
				forgetPasswordService.getUserDetailsByEmailidPassword(Integer.valueOf(userId), password);
				response.sendRedirect("." + URIConstant.FORGET_PASSWORD_SUCCESS);
			} catch (Exception e){
				e.printStackTrace();
			}
		} else {
			this.encUID = encUserId;
			request.setAttribute("errorMsg", "Password mismatch");
			doGet(request, response);
		}
	}

}
