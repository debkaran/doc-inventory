package com.docInventory.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public final class StringUtils {
	public static final String uriEncodeValue(String str) {
		try {
			str = URLEncoder.encode(str, StandardCharsets.UTF_8.toString());
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
	    return str;
	}
	
	public static final boolean isEmpty(String str) {
		return str == null || str.trim().isEmpty();
	}
}
