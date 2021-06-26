package com.docInventory.entity;

import java.util.Date;

public class UserDetailsEntity {
	private Integer id;
	private String name;
	private String email;
	private String role;
	private String password;
	private String profilePicture;
	private Float storageSpace;
	private Date dob;
	private Date createdDate;
	private Date lastLoginTime;
	private Integer noOfFailureLogin;
	private Date lastFailureLoginTime;
	private Boolean isActive;
	private Boolean isDelete;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	public Float getStorageSpace() {
		return storageSpace;
	}

	public void setStorageSpace(Float storageSpace) {
		this.storageSpace = storageSpace;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Integer getNoOfFailureLogin() {
		return noOfFailureLogin;
	}

	public void setNoOfFailureLogin(Integer noOfFailureLogin) {
		this.noOfFailureLogin = noOfFailureLogin;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public Date getLastFailureLoginTime() {
		return lastFailureLoginTime;
	}

	public void setLastFailureLoginTime(Date lastFailureLoginTime) {
		this.lastFailureLoginTime = lastFailureLoginTime;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

}
