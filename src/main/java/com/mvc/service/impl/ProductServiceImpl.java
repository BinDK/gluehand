package com.mvc.service.impl;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.entity.Product;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.repository.ProductRepository;
import com.mvc.service.ProductService;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductRepository productRepository;

	@Override
	public List<JSONObject> listProductFilterStatus(ProductStatusEnum status) {
		switch (status) {
		case ALL:
			return productRepository.findAllProduct(ProductStatusEnum.APPROVED.getId(),ProductStatusEnum.BIDDING.getName());
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
