package com.mvc.service;

import org.springframework.stereotype.Service;

import com.mvc.entity.User;

@Service
public interface UserService {
	public User updateUser(User user);
}
