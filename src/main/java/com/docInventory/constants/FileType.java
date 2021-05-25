package com.docInventory.constants;

public enum FileType {
	FILE("F"), DIRECTORY("D");

	private final String name;

	private FileType(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}
}
