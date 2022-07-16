package com.mvc.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.entity.Product;
import com.mvc.entity.User;
import com.mvc.enums.ErrorEnum;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.enums.UserStatusEnum;
import com.mvc.repository.ProductRepository;
import com.mvc.repository.UserRepository;
import com.mvc.response.ResponseUser;
import com.mvc.service.ProductService;
import com.mvc.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public List<Product> listProductFilterStatus(ProductStatusEnum status) {
		switch (status) {
		case ALL:
			return productRepository.findAll();
		case NOT_APPROVE:
			return productRepository.findProductNotApprove(status.getId());
		case APPROVED:
			return productRepository.findProductApprove(status.getId());
		case BIDDING:
			return productRepository.findProductBidding(ProductStatusEnum.APPROVED.getId());
		case BIDED:
			return productRepository.findProductBidded(ProductStatusEnum.APPROVED.getId());

		default:
			break;
		}
		return null;
	}

	@Override
	public Product create(Product product) {
	
		return productRepository.save(product);
	}



}
