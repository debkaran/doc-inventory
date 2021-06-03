package com.docInventory.jdbc.dto;

public class SqlParamDTO {
	private String paramType;
	private Object param;
	private Integer length;

	public String getParamType() {
		return paramType;
	}

	public Object getParam() {
		return param;
	}

	public Integer getLength() {
		return length;
	}

	public SqlParamDTO(String paramType, Object param) {
		this.paramType = paramType;
		this.param = param;
		this.length = 0;
	}
	
	public SqlParamDTO(String paramType, Object param, Integer length) {
		this.paramType = paramType;
		this.param = param;
		this.length = length;
	}
}
