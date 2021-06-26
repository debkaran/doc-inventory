package com.docInventory.util;

import java.nio.charset.StandardCharsets;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class AES256 {
	private static final String SECRET_KEY = "Bw}cE@0\"_bFn3yXueNip@fxBwa8z~╧fl,YSR+qxp,}[Ihx¼:i[|Fn#M22389F35[;|HJDHjsd*^&$@%903097hvj5";
	private static final String SALT = "Z8o6-ve/9M_PI}}!ijlIA@d<Ki*-lM-^>bOyww!É⌐b╣^R(.)g\"#j~m<a>83RU$;%M0},?!!!!";

	private static Cipher getCipher(int mode) throws Exception {
		byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
		IvParameterSpec ivspec = new IvParameterSpec(iv);

		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
		KeySpec spec = new PBEKeySpec(SECRET_KEY.toCharArray(), SALT.getBytes(), 65536, 256);
		SecretKey tmp = factory.generateSecret(spec);
		SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

		Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		cipher.init(mode, secretKey, ivspec);

		return cipher;
	}

	public static String encrypt(String strToEncrypt) throws Exception {
		Cipher cipher = getCipher(Cipher.ENCRYPT_MODE);
		return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8)));
	}

	public static String encrypt(Integer strToEncrypt) throws Exception {
		Cipher cipher = getCipher(Cipher.ENCRYPT_MODE);
		return Base64.getEncoder()
				.encodeToString(cipher.doFinal(String.valueOf(strToEncrypt).getBytes(StandardCharsets.UTF_8)));
	}

	public static String decrypt(String strToDecrypt) throws Exception {
		Cipher cipher = getCipher(Cipher.DECRYPT_MODE);
		return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
	}
}