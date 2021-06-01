package com.docInventory.dto;

public class UpdateQueryDTO {
	private Integer noOfRowEffected;
	private Integer lastGeneretedId;

	public Integer getLastGeneretedId() {
		return lastGeneretedId;
	}

	public void setLastGeneretedId(Integer lastGeneretedId) {
		this.lastGeneretedId = lastGeneretedId;
	}

	public Integer getNoOfRowEffected() {
		return noOfRowEffected;
	}

	public void setNoOfRowEffected(Integer noOfRowEffected) {
		this.noOfRowEffected = noOfRowEffected;
	}

	@Override
	public String toString() {
		return "UpdateQueryDTO [noOfRowEffected=" + noOfRowEffected + ", lastGeneretedId=" + lastGeneretedId + "]";
	}
}
