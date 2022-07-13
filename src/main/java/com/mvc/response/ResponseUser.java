package com.mvc.response;

import com.mvc.entity.User;

import lombok.Data;

@Data
public class ResponseUser {
	private User user;
	private Boolean hasError = false;
	private String error;
	public void setUser(User user) {
		this.user = user;
	}
	public void setHasError(Boolean hasError) {
		this.hasError = hasError;
	}
	public void setError(String error) {
		this.error = error;
	}
	public User getUser() {
		return user;
	}
	public Boolean getHasError() {
		return hasError;
	}
	public String getError() {
		return error;
	}
	
	

}
