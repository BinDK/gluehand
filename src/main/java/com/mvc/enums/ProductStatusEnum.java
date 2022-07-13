package com.mvc.enums;

import lombok.Getter;

@Getter
public enum ProductStatusEnum {
	NOT_APPROVE(0,"Chua duyet"),
	APPROVE(1,"Da duyet"),
	;
	
	
	ProductStatusEnum(int id,String name)
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
