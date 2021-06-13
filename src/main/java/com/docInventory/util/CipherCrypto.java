package com.docInventory.util;

public class CipherCrypto {
	public static void main(String args[]) throws Exception {
		String plainText = "www.baeldung.com";
		System.out.println(AES256.encrypt(plainText));
		System.out.println(AES256.decrypt("JgfjVwX54eWWCNHDS522kUKNQh6FqWpYib13bFukaY9U="));
	}
}
