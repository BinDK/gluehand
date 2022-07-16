package com.mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.entity.User;
import com.mvc.response.ResponseUser;

public interface UserService {
	public ResponseUser createUser(User user);
	public ResponseUser updateUser(User user);
	public ResponseUser deleteUser(int id);
	public List<User> findAllUser();
}
