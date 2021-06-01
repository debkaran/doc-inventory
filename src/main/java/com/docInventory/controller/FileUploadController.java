package com.docInventory.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.docInventory.constants.URIConstant;
import com.docInventory.dto.FileDetailsDTO;
import com.docInventory.service.UploadService;
import com.docInventory.service.impl.UploadServiceImpl;
import com.google.gson.Gson;

@WebServlet(URIConstant.FILE_UPLOAD)
@MultipartConfig
public class FileUploadController extends HttpServlet {
	private final Gson gson = new Gson();
	private static final long serialVersionUID = 1L;
	private final UploadService uploadService = new UploadServiceImpl();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException(
					"Request is not multipart, please 'multipart/form-data' enctype for your form.");
		}
		PrintWriter writer = response.getWriter();
		try {
			String userid = "2";
			List<FileDetailsDTO> fileDetails = uploadService.upload(userid, request, response);

			String employeeJsonString = this.gson.toJson(fileDetails);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			writer.print(employeeJsonString);
			writer.flush();
		} catch (FileUploadException e) {
			throw new RuntimeException(e);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			writer.close();
		}
	}

}
