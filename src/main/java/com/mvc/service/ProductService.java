package com.mvc.service;

import java.util.List;

import com.mvc.response.ResponseActionProduct;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.mvc.entity.Product;
import com.mvc.entity.User;
import com.mvc.enums.ProductStatusEnum;


public interface ProductService {
	public Product create(Product product);
	
	public List<JSONObject> listProductFilterStatus(ProductStatusEnum status);

	public ResponseActionProduct actionProduct(ProductStatusEnum productStatusEnum,int idProduct);
}
