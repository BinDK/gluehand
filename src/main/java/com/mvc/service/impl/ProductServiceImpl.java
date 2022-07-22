package com.mvc.service.impl;

import java.util.List;
import java.util.Optional;

import com.mvc.entity.Category;
import com.mvc.enums.ErrorEnum;
import com.mvc.repository.CategoryRepository;
import com.mvc.response.ResponseActionProduct;
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

	@Autowired
	CategoryRepository cateRepo;


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
	public ResponseActionProduct actionProduct(ProductStatusEnum productStatusEnum,int idProduct) {
		try {
			Optional<Product> id = productRepository.findById(idProduct);
			if(!id.isPresent()){
				return new ResponseActionProduct(true,ErrorEnum.PRODUCT_NOT_EXIST.getName());

			}
			else
				if(id.get().getProduct_status_id() != ProductStatusEnum.NOT_APPROVE.getId())
					return new ResponseActionProduct(true, ErrorEnum.PRODUCT_NOT_STATUS_NOT_APPROVE.getName());

			switch (productStatusEnum) {
				case APPROVED:
					return actionApproveProduct(productStatusEnum,id.get());
				case DISAPPROVED:
					return actionDisapproveProduct(productStatusEnum,id.get());
			}
		}
		catch (Exception e){
			return new ResponseActionProduct(true,e.getMessage());
		}
		return null;
	}

	private ResponseActionProduct actionDisapproveProduct(ProductStatusEnum productStatusEnum, Product product) {
		product.setProduct_status_id(ProductStatusEnum.DISAPPROVED.getId());
		productRepository.save(product);
		return new ResponseActionProduct(false,ErrorEnum.SUCCESS.getName());
	}

	private ResponseActionProduct actionApproveProduct(ProductStatusEnum productStatusEnum, Product product) {
		product.setProduct_status_id(ProductStatusEnum.APPROVED.getId());
		productRepository.save(product);
		return new ResponseActionProduct(false,ErrorEnum.SUCCESS.getName());
	}

	@Override
	public Product create(Product product) {
	
		return productRepository.save(product);
	}


	//Của Bình
@Override
	public  List<Category> findALlCate(){
		return cateRepo.findAll();
}
	@Override
	public  Category createCate(String cateName){
		Category c = new Category();
		c.setName(cateName);
		Category c2 = cateRepo.save(c);
		if(c2 != null){
		return c2;
		} else {return null;}
	}


}
