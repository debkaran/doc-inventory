package com.docInventory.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.constants.FormatConstant;
import com.docInventory.constants.URIConstant;
import com.docInventory.dto.UserDTO;
import com.docInventory.service.impl.UserRegistrationService;

@WebServlet(URIConstant.REGISTRATION)
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserRegistrationService registrationService = new UserRegistrationService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/registration.jsp");
		requestDispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String name = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String dateOfBirth = request.getParameter("dateOfBirth");
		String agree = request.getParameter("terms");
		
		SimpleDateFormat format = new SimpleDateFormat(FormatConstant.INPUT_DATE_FORMAT);
		try {
			Date dob = format.parse(dateOfBirth);
			UserDTO user = new UserDTO();
			user.setName(name);
			user.setEmail(email);
			user.setPassword(password);
			user.setConfirmPassword(confirmPassword);
			user.setDateOfBirth(dob);
			user.setAgree(agree);
			Integer lastRegistrationId = registrationService.registration(request, user);
			if(lastRegistrationId != null) {
				registrationService.generateOTPForProfileActivation(getServletContext(), lastRegistrationId, user.getEmail());
			}
		} catch (ParseException e) {
			e.printStackTrace();
			request.setAttribute("errorMsg", "Invalid date format, please maintain " + FormatConstant.INPUT_DATE_FORMAT + " format");
		} catch (IllegalArgumentException e) {
			request.setAttribute("errorMsg", e.getMessage());
		}
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("WEB-INF/views/jsps/registration.jsp");
		requestDispatcher.forward(request, response);
	}
}
