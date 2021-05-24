package com.docInventory.dto;

public class FileDetails {
	private String filename;
	private Long filesize;
	private String fileFullyQualifiedPath;
	private String contentType;

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Long getFilesize() {
		return filesize;
	}

	public void setFilesize(Long filesize) {
		this.filesize = filesize;
	}

	public String getFileFullyQualifiedPath() {
		return fileFullyQualifiedPath;
	}

	public void setFileFullyQualifiedPath(String fileFullyQualifiedPath) {
		this.fileFullyQualifiedPath = fileFullyQualifiedPath;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

}
