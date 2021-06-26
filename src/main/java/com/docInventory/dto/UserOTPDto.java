package com.docInventory.dto;

public class UserOTPDto {
	private Integer userId;
	private String sourcePage;
	private String otp;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getSourcePage() {
		return sourcePage;
	}

	public void setSourcePage(String sourcePage) {
		this.sourcePage = sourcePage;
	}

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

}
