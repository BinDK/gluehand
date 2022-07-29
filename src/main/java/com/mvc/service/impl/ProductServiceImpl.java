package com.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.entity.Category;
import com.mvc.entity.ImgProduct;
import com.mvc.enums.ErrorEnum;
import com.mvc.repository.CategoryRepository;
import com.mvc.repository.ImgProductRepository;
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

	@Autowired
	ImgProductRepository imgRepo;



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
	public List<JSONObject> findProdJ(int statuss,String datenow) {
		try {
			return productRepository.findProdJ(statuss,datenow);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public List<JSONObject> ProdWithCategory(int statuss,String datenow,int cateid) {
		try {
			return productRepository.ProdWithCategory(statuss,datenow,cateid);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	@Override
	public JSONObject findProd(int statuss) {
		try {
			return productRepository.findProd(statuss);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

	@Override
	public List<JSONObject> listProductFilterStatusxx(ProductStatusEnum status, int uidd) {
		switch (status) {
//			case ALL:
//				return productRepository.findAllProduct(ProductStatusEnum.APPROVED.getId(),ProductStatusEnum.BIDDING.getName());
			case NOT_APPROVE:
				return productRepository.findProductNotApprovexx(status.getId(),uidd);
			case APPROVED:
				return productRepository.findProductApprovexx(status.getId(),uidd);
//			case BIDDING:
//				return productRepository.findProductBiddingxx(ProductStatusEnum.APPROVED.getId(),uidd);
//			case BIDED:
//				return productRepository.findProductBiddedxx(ProductStatusEnum.APPROVED.getId(),uidd);
			default:
				break;
		}
		return null;
	}

	@Override
	public List<JSONObject> findProductNotApprovexx(int i, int uidd) {
//		ProductStatusEnum status = new ProductStatus();
		return productRepository.findProductNotApprovexx(0,uidd);

	}

	@Override
	public List<JSONObject> findPaidProd(int buyer_id) {
//		List<Product> products = new ArrayList<Product>();
//		List<JSONObject> prods = productRepository.findPAIDProd(buyer_id);
//
//
//		for (int i=0; i<prods.size(); i++)
//		{
//			prods.
//		}
		return productRepository.findPAIDProd(buyer_id);
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

	@Override
	public List<JSONObject> listProductFilterStatusHaveCateGory(ProductStatusEnum status, int cateid) {
		switch (status) {
			case NOT_APPROVE:
				return productRepository.findProductNotApproveFilterCategory(status.getId(),cateid);
			default:
				break;
		}
		return null;
	}

	private ResponseActionProduct actionApproveProduct(ProductStatusEnum productStatusEnum, Product product) {
		product.setProduct_status_id(ProductStatusEnum.APPROVED.getId());
		productRepository.save(product);
		return new ResponseActionProduct(false,ErrorEnum.SUCCESS.getName());
	}

	@Override
	public Integer create(Product product) {

		return productRepository.save(product).getId();
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

	@Override
	public Integer changeBidding(int statuss, int idProd) {
		Optional<Product> id = productRepository.findById(idProd);
		id.get().setProduct_status_id(statuss);

		return productRepository.save(id.get()).getId();
	}

	@Override
	public boolean uploadImg(ImgProduct img){
		if(imgRepo.save(img) != null){
			return true;
		}else{return false;}
	}

}
