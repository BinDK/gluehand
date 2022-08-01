package com.mvc.enums;

import lombok.Getter;

@Getter
public enum MoneyPurposeEnum {
	RECHARGE(1,"Recharge"),
	WITHDRAW(2,"Withdraw"),
	PAYED(3,"Paid")
	;


	MoneyPurposeEnum(int id, String name)
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
