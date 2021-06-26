package com.docInventory.entity;

import java.util.Date;

public class UserOTPDetailsEntity {
	private Integer id;
	private Integer userId;
	private String sourcePage;
	private String otp;
	private Date otpGenerationDate;
	private Boolean isUsed;
	private Boolean isDelete;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public Date getOtpGenerationDate() {
		return otpGenerationDate;
	}

	public void setOtpGenerationDate(Date otpGenerationDate) {
		this.otpGenerationDate = otpGenerationDate;
	}

	public Boolean getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(Boolean isUsed) {
		this.isUsed = isUsed;
	}

	public String getSourcePage() {
		return sourcePage;
	}

	public void setSourcePage(String sourcePage) {
		this.sourcePage = sourcePage;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}
}
