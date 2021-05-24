package com.docInventory.service.impl;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.docInventory.constants.VMArgumentConstant;
import com.docInventory.dto.FileDetails;
import com.docInventory.service.UploadService;

public class UploadServiceImpl implements UploadService {

	public List<FileDetails> upload(String userid, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String directoryRootPath = request.getParameter("path");
		String directoryStruct = request.getParameter("dir_structs");
		String[] dirArr = null;
		if(directoryStruct != null) {
			directoryStruct = directoryStruct.substring(0, directoryStruct.lastIndexOf("###"));
			dirArr = directoryStruct.split("###");
		}
		List<FileDetails> fileDetails = new ArrayList<>();
		List<Part> fileParts = request.getParts().stream().filter(part -> "file".equals(part.getName()))
				.collect(Collectors.toList());

		directoryRootPath = directoryRootPath.replace("/root/", "").replace("/", File.separator);
		String uploadFilePath = VMArgumentConstant.TEMP_LOCATION + File.separator + userid + File.separator
				+ directoryRootPath;
		// creates the save directory if it does not exists
		File fileSaveDir = new File(uploadFilePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}

		for (int i=0; i < fileParts.size(); i++) {
			String dir = "";
			Part filePart = fileParts.get(i);
			if(dirArr != null) {
				dir = dirArr[i];
				fileSaveDir = new File(uploadFilePath + File.separator + dir);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}
			}
			
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String fileFullyQualifiedPath = "";
			if(directoryStruct != null) {
				fileFullyQualifiedPath = uploadFilePath + File.separator + dir + File.separator + fileName;
			} else {
				fileFullyQualifiedPath = uploadFilePath + File.separator + fileName;
			}
			
			filePart.write(fileFullyQualifiedPath);

			FileDetails fileDetail = new FileDetails();
			fileDetail.setFilename(fileName);
			fileDetail.setFilesize(filePart.getSize());
			fileDetail.setFileFullyQualifiedPath(fileFullyQualifiedPath);
			fileDetail.setContentType(filePart.getContentType());
			fileDetails.add(fileDetail);
		}

		return fileDetails;
	}
}
