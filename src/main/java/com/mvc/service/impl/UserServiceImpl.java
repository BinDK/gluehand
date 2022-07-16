package com.mvc.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.entity.User;
import com.mvc.enums.ErrorEnum;
import com.mvc.enums.UserStatusEnum;
import com.mvc.repository.UserRepository;
import com.mvc.response.ResponseUser;
import com.mvc.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;

	@Override
	public ResponseUser createUser(User user) {
		ResponseUser res = new ResponseUser();
		res.setUser(userRepository.save(user));
		user.setIsAdmin(false);
		res.setHasError(userRepository.save(user) == null ? false : true);
		return res;
	}

	@Override
	public ResponseUser updateUser(User user) {
		ResponseUser res = new ResponseUser();
		Optional<User> u = userRepository.findById(user.getId());
		validUser(u,res);
		res.setUser(userRepository.save(user));
		return res;
	}

	private void validUser(Optional<User> u, ResponseUser res) {
		if(!u.isPresent()) {
			res.setHasError(true);
			res.setError(ErrorEnum.NOT_FIND_USER.getName());
		}
			
		if(u.get().getIsAdmin()) {
			res.setHasError(true);;
			res.setError(ErrorEnum.NOT_USER.getName());
		}
	}

	@Override
	public ResponseUser deleteUser(int id) {
		ResponseUser res = new ResponseUser();
		Optional<User> u = userRepository.findById(id);
		validUser(u,res);
		
		u.get().setUserStatus(UserStatusEnum.DELETE.getId());
		res.setUser(userRepository.save(u.get()));
		return res;
	}

	@Override
	public List<User> findAllUser() {
		return userRepository.findAll();
	}


}
