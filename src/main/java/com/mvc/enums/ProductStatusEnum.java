package com.mvc.enums;

import lombok.Getter;

@Getter
public enum ProductStatusEnum {
	ALL(-1,"List All Product"),
	NOT_APPROVE(0,"Not Approve"),
	APPROVED(1,"Approved"),
	DISAPPROVED(2,"Disapproved"),
	BIDDING(3,"Bidding"),
	BIDED(4,"Bided"),
	PAID(5,"Paid"),
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
