package com.docInventory.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.docInventory.dto.FileDetailsDTO;

public interface UploadService {
	List<FileDetailsDTO> upload(String userid, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
