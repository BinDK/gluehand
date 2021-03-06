package com.mvc.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.entity.User;
import com.mvc.enums.ErrorEnum;
import com.mvc.enums.UserStatusEnum;
import com.mvc.repository.UserRepository;
import com.mvc.response.ResponseUser;
import com.mvc.service.AdminService;
import com.mvc.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	UserRepository userRepository;

	@Override
	public ResponseUser createAdmin(User admin) {
		ResponseUser res = new ResponseUser();
		admin.setIsAdmin(true);
		admin = userRepository.save(admin);
		res.setUser(admin);
		res.setHasError(admin == null);
		return res;
	}

	@Override
	public ResponseUser updateAdmin(User admin) {
		ResponseUser res = new ResponseUser();
		Optional<User> u = userRepository.findById(admin.getId());
		validAdmin(u,res);

		res.setUser(userRepository.save(admin));
		return res;
	}

	@Override
	public ResponseUser deleteAdmin(int id) {
		ResponseUser res = new ResponseUser();
		Optional<User> u = userRepository.findById(id);
		validAdmin(u,res);

		u.get().setUserStatus(UserStatusEnum.DELETE.getId());
		res.setUser(userRepository.save(u.get()));
		return res;
	}

	/*
	 * Check error
	 */
	public void validAdmin(Optional<User> u, ResponseUser res) {
		if(!u.isPresent()) {
			res.setHasError(true);
			res.setError(ErrorEnum.NOT_FIND_ADMIN.getName());
		}

		if(!u.get().getIsAdmin()) {
			res.setHasError(true);;
			res.setError(ErrorEnum.NOT_ADMIN.getName());
		}

	}
}
