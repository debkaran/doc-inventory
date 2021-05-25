package com.docInventory.dto;

import com.docInventory.constants.FileType;

public class FileDetails {
	private String filename;
	private Long filesize;
	private String fileFullyQualifiedPath;
	private String contentType;
	private String physicalUplodedDirectory;
	private String relativeUplodedDirectory;
	private String parentDirectoryName;
	private FileType fileType;

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

	public String getParentDirectoryName() {
		return parentDirectoryName;
	}

	public void setParentDirectoryName(String parentDirectoryName) {
		this.parentDirectoryName = parentDirectoryName;
	}

	public String getPhysicalUplodedDirectory() {
		return physicalUplodedDirectory;
	}

	public void setPhysicalUplodedDirectory(String physicalUplodedDirectory) {
		this.physicalUplodedDirectory = physicalUplodedDirectory;
	}

	public String getRelativeUplodedDirectory() {
		return relativeUplodedDirectory;
	}

	public void setRelativeUplodedDirectory(String relativeUplodedDirectory) {
		this.relativeUplodedDirectory = relativeUplodedDirectory;
	}

	public FileType getFileType() {
		return fileType;
	}

	public void setFileType(FileType fileType) {
		this.fileType = fileType;
	}
}
