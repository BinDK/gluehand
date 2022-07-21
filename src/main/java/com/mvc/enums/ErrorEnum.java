package com.mvc.enums;

import lombok.Getter;

@Getter
public enum ErrorEnum {
	NOT_FIND_ADMIN("không tìm thấy admin"),
	NOT_FIND_USER("Not found user"),
	NOT_ADMIN("không phải tài khoản admin"),
	NOT_USER("Account must type user"),
	PRODUCT_NOT_STATUS_NOT_APPROVE("Product must not status is NOT APPROVE"),
	SUCCESS("SUCCESS"),
	PRODUCT_NOT_EXIST("Product not exist"),
	;
	
	
	ErrorEnum(String name)
	{
		this.name = name;
	}
	private String name;
	
	
	public String getName() {
		return name;
	}

	
	
}
