package com.mvc.service.impl;

import com.mvc.entity.ImgProduct;
import com.mvc.entity.User;
import com.mvc.enums.ErrorEnum;
import com.mvc.enums.UserStatusEnum;
import com.mvc.repository.ImgProductRepository;
import com.mvc.repository.UserRepository;
import com.mvc.response.ResponseUser;
import com.mvc.service.AdminService;
import com.mvc.service.GeneralService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class GeneralServiceImpl implements GeneralService {
	
	@Autowired
	UserRepository repo;
	@Autowired
	ImgProductRepository imgrepo;

	@Override
	public ResponseUser login(User admin) {
		ResponseUser res = new ResponseUser();
		res.setUser(repo.save(admin));
		admin.setIsAdmin(true);
		res.setHasError(repo.save(admin) == null ? false : true);
		return res;
	}

	@Override
	public ResponseUser signup(User admin) {
		ResponseUser res = new ResponseUser();
		Optional<User> u = repo.findById(admin.getId());
		validAdmin(u,res);
		
		res.setUser(repo.save(admin));
		return res;
	}


	@Override
	public int matchuname(String uname) {
		try {
			return repo.checkuanme(uname);
		} catch (Exception e){
			System.out.println(e.getMessage());
			return 0;
		}
	}

	@Override
	public int matchemail(String email) {
		try {
			return repo.checkemail(email);
		} catch (Exception e){
			System.out.println(e.getMessage());
			return 0;
		}
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

	@Override
	public List<JSONObject> ProdIMG(int id) {
		return imgrepo.productimggg(id);
	}
}
