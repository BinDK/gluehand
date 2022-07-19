package com.mvc.enums;

import lombok.Getter;

@Getter
public enum UserStatusEnum {
	DELETE(0,"xoa san pham"),
	ACTIVE(1,"active")
	;
	
	
	UserStatusEnum(int id,String name)
	{
		this.id = id;
		this.name = name;
	}
	private int id;
	private String name;
	public int getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}

	
	
}
