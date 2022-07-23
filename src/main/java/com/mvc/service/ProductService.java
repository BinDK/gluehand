package com.mvc.service;

import java.util.List;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.entity.Category;
import com.mvc.entity.ImgProduct;
import com.mvc.response.ResponseActionProduct;
import org.json.simple.JSONObject;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import com.mvc.entity.Product;
import com.mvc.entity.User;
import com.mvc.enums.ProductStatusEnum;


public interface ProductService {
	public Integer create(Product product);
	
	public List<JSONObject> listProductFilterStatus(ProductStatusEnum status);

	public ResponseActionProduct actionProduct(ProductStatusEnum productStatusEnum,int idProduct);


	//Của Bình
	List<Category> findALlCate();
	Category createCate(String catename);
	boolean uploadImg(ImgProduct img);
	public List<JSONObject> listProductFilterStatusxx(ProductStatusEnum status,int uidd);

//	public List<ProductJ> findProdJ(ProductStatusEnum status,int uidd);


	List<JSONObject> findProductNotApprovexx(int i, int uidd);


    List<JSONObject> listProductFilterStatusHaveCateGory(ProductStatusEnum notApprove, int cateid);
}
