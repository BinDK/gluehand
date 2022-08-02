package com.mvc.service;

import java.util.List;
import java.util.Optional;

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

	public Integer changeBidding(int statuss,int idProd);

	public List<JSONObject> listProductFilterStatusxx(ProductStatusEnum status,int uidd);

	public List<JSONObject> findProdJ(int statuss,String datenow);
	public List<JSONObject> ProdWithCategory(int statuss,String datenow,int cateid);

	public List<JSONObject> findPaidProd(int buyer_id);

	public JSONObject findProd(int statuss);


	List<JSONObject> findProductNotApprovexx(int i, int uidd);


    List<JSONObject> listProductFilterStatusHaveCateGory(ProductStatusEnum notApprove, int cateid);

	JSONObject purchase(int productId);
}
