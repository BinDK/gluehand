package com.mvc.service;

import org.springframework.stereotype.Service;

import com.mvc.entity.User;
import com.mvc.response.ResponseUser;

@Service
public interface AdminService {
	public ResponseUser createAdmin(User admin);
	public ResponseUser updateAdmin(User admin);
	public ResponseUser deleteAdmin(int id);
}
