package com.docInventory.jdbc.util;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.docInventory.jdbc.dto.SqlParamDTO;

public class ParamBuilder {
	protected List<SqlParamDTO> params;
	
	public ParamBuilder() {
		this.params = new ArrayList<>();
	}

	public void setParams(List<SqlParamDTO> params) {
		this.params = params;
	}

	public List<SqlParamDTO> getParams() {
		return params;
	}

	public ParamBuilder setParam(Integer param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Integer", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(Long param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Long", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(String param) {
		SqlParamDTO paramDTO = new SqlParamDTO("String", param);
		params.add(paramDTO);
		return this;
	}

	public ParamBuilder setParam(Float param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Float", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(Double param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Double", param);
		params.add(paramDTO);
		return this;
	}

	public ParamBuilder setParam(Date param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Date", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(Integer[] param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Integer[]", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(Long[] param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Long[]", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(String[] param) {
		SqlParamDTO paramDTO = new SqlParamDTO("String[]", param);
		params.add(paramDTO);
		return this;
	}

	public ParamBuilder setParam(Float[] param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Float[]", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(Double[] param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Double[]", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(Object param) {
		SqlParamDTO paramDTO = new SqlParamDTO("Object", param);
		params.add(paramDTO);
		return this;
	}
	
	public ParamBuilder setParam(InputStream param, Integer length) {
		SqlParamDTO paramDTO = new SqlParamDTO("InputStream", param, length);
		params.add(paramDTO);
		return this;
	}
}
