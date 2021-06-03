package com.docInventory.service.impl;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.docInventory.constants.FileType;
import com.docInventory.constants.VMArgumentConstant;
import com.docInventory.dto.FileDetailsDTO;
import com.docInventory.service.UploadService;

public class UploadServiceImpl implements UploadService {

	public List<FileDetailsDTO> upload(String userid, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String directoryRootPath = request.getParameter("path");
		String relativeUplodedPath = directoryRootPath;
		String directoryStruct = request.getParameter("dir_structs");
		String[] dirArr = null;
		if (directoryStruct != null) {
			directoryStruct = directoryStruct.substring(0, directoryStruct.lastIndexOf("###"));
			dirArr = directoryStruct.split("###");
			dirArr = Stream.of(dirArr).map(dir -> {
				String[] splitArr = dir.split("\\\\|/");
				return String.join(File.separator, splitArr);
			}).toArray(String[]::new);
		}
		List<FileDetailsDTO> fileDetails = new ArrayList<>();
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

		for (int i = 0; i < fileParts.size(); i++) {
			String dir = "";
			Part filePart = fileParts.get(i);
			FileDetailsDTO fileDetail = new FileDetailsDTO();
			if (dirArr != null) {
				dir = dirArr[i];
				fileSaveDir = new File(uploadFilePath + File.separator + dir);
				if (!fileSaveDir.exists()) {
					fileSaveDir.mkdirs();
				}
				String sep = Matcher.quoteReplacement(File.separator);
				String parentDirectoryName = dir.split(sep)[0];
				fileDetail.setParentDirectoryName(parentDirectoryName);
			}
			String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String fileFullyQualifiedPath = "";
			if (directoryStruct != null) {
				fileFullyQualifiedPath = uploadFilePath + File.separator + dir + File.separator + fileName;
				fileDetail.setFileType(FileType.DIRECTORY);
			} else {
				fileFullyQualifiedPath = uploadFilePath + File.separator + fileName;
				fileDetail.setFileType(FileType.FILE);
			}
			filePart.write(fileFullyQualifiedPath);

			fileDetail.setFilename(fileName);
			fileDetail.setFilesize(filePart.getSize());
			fileDetail.setFileFullyQualifiedPath(fileFullyQualifiedPath);
			fileDetail.setContentType(filePart.getContentType());
			fileDetail.setPhysicalUplodedDirectory(uploadFilePath);
			fileDetail.setRelativeUplodedDirectory(relativeUplodedPath);
			fileDetails.add(fileDetail);
		}

		return fileDetails;
	}
}
