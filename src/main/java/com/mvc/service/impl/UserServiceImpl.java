package com.mvc.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.entity.User;
import com.mvc.repository.UserRepository;
import com.mvc.service.UserService;

public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;

	@Override
	public User updateUser(User user) {
		Optional<User> u = userRepository.findById(user.getId());
		if(u.isEmpty())
			return null;
		return userRepository.save(user);
	}
}
