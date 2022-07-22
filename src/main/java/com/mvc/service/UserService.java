package com.mvc.service;

import java.util.List;

import com.mvc.ajaxentity.UserJ;
import com.mvc.enums.UserStatusEnum;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.mvc.entity.User;
import com.mvc.response.ResponseUser;

public interface UserService {
	//Của Bình
	public ResponseUser createUser(User user);
	public Integer createUser1(User user);
	public Integer upUser(User user);
	public boolean changepass(User user);

	public User findID(int id);
	public UserJ signin(String uname, String pass);


	//Của Đạt
	public ResponseUser updateUser(User user);
	public ResponseUser deleteUser(int id);
	public List<User> findAllUser();

	List<JSONObject> listUserNotBan(UserStatusEnum id);
}
