package com.mvc.enums;

import lombok.Getter;

@Getter
public enum ProductStatusEnum {
	ALL(-1,"list all"),
	NOT_APPROVE(0,"Chua duyet"),
	APPROVED(1,"Da duyet"),
	DISAPPROVED(2,"Disapproved"),
	BIDDING(3,"Dang dau gia"),
	BIDED(4,"Da dau gia"),
	PAID(5,"Da thanh toan"),
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
