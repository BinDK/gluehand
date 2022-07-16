package com.mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mvc.entity.Product;
import com.mvc.entity.User;
import com.mvc.enums.ProductStatusEnum;


public interface ProductService {
	public Product create(Product product);
	
	public List<Product> listProductFilterStatus(ProductStatusEnum status);
}
