package com.mvc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.entity.*;
import com.mvc.enums.ErrorEnum;
import com.mvc.repository.*;
import com.mvc.request.EmailDetails;
import com.mvc.response.ResponseActionProduct;
import com.mvc.service.EmailService;
import com.mvc.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.enums.ProductStatusEnum;
import com.mvc.service.ProductService;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductRepository productRepository;

	@Autowired
	CategoryRepository cateRepo;

	@Autowired
	ImgProductRepository imgRepo;

	@Autowired
	UserRepository userRepository;

	@Autowired
	WalletRepository walletRepository;

	@Autowired
	EmailService emailServiceImpl;


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

	@Override
	public JSONObject purchase(int productId) {
		JSONObject result = new JSONObject();
		try {
			Optional<Product> product = productRepository.findById(productId);
			if(!product.isPresent()) {
				result.put("error", "product not exist");
				return result;
			}
			// kiem tra san pham co nguoi dau gia khong
			Optional<User> user = userRepository.findById(product.get().getBuyer_id());

			if(!user.isPresent()) {
				result.put("error", "product have not buyer");
				return result;
			}
			// kiem tra vi tien nguoi thang
			Optional<Wallet> wallet = walletRepository.findByIdUser(user.get().getId());
			if(!wallet.isPresent()) {
				result.put("error", "Buyer have not wallet");
				return result;
			}
				if(wallet.get().getMoney()< product.get().getPrice_minium()) {
					result.put("error", "Buyer have not money in wallet, please add money in wallet!");
					return result;
				}
			CompletableFuture<String> completableFuture = new CompletableFuture<>();

			System.out.println("Manually complete 1");

			// gui email cho nguoi thang
			EmailDetails BuyerEmailDetail = EmailDetails.builder()
							.recipient(user.get().getEmail())
									.subject("Purchase "+product.get().getProduct_name())
											.msgBody("You purchased success").build();
			;
			completableFuture.complete(emailServiceImpl.sendSimpleMail(BuyerEmailDetail));

			// kiem tra san pham co nguoi dau gia khong
			CompletableFuture<String> completableFuture2 = new CompletableFuture<>();
			// gui email cho nguoi ban
			EmailDetails SellerEmailDetail = EmailDetails.builder()
					.recipient(product.get().getSeller().getEmail())
					.subject("Purchase "+product.get().getProduct_name())
					.msgBody(user.get().getFullname() +" purchased success "+product.get().getProduct_name()).build();

			completableFuture2.complete(emailServiceImpl.sendSimpleMail(SellerEmailDetail))
			;
			System.out.println("Manually complete 2");

			product.get().setProduct_status_id(ProductStatusEnum.PAID.getId());
			productRepository.save(product.get());

			wallet.get().setMoney(wallet.get().getMoney()-product.get().getPrice_minium());
			walletRepository.save(wallet.get());

			Optional<Wallet> walletSeller = walletRepository.findByIdUser(product.get().getSeller().getId());
			try {
				walletSeller.ifPresent(wallet1 -> {
					wallet1.setMoney(wallet1.getMoney()+product.get().getPrice_minium());
				});
			} catch (Exception e) {
				result.put("error","Seller have not wallet");
				return result;
			}
			result.put("products",productRepository.findPAIDProd(user.get().getId()));
			result.put("success","okay");
		} catch (Exception e) {
			result.put("error", e.getMessage());
		}
		return  result;

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
