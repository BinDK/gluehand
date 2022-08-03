package com.mvc.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.entity.*;
import com.mvc.enums.ErrorEnum;
import com.mvc.enums.MoneyPurposeEnum;
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

	//của Bình ddẻ làm nút purchase
	@Autowired
	HistoryWalletRepo hwRepo;
	@Autowired
	BidHistoryRepository bhRepo;
	@Autowired
	UserService uss;

	@Autowired
	MoneyPurposeRepository moneyPurposeRepository;

	@Autowired
	HistoryRepository historyRepository;

	@Autowired
	BidHistoryRepository bidHistoryRepository;

	//Hết của bình
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
				result.put("errorx", "product not exist");
				return result;
			}
			// kiem tra san pham co nguoi dau gia khong
			Optional<User> user = userRepository.findById(product.get().getBuyer_id());

			if(!user.isPresent()) {
				result.put("errorx", "product have not buyer");
				return result;
			}
			// kiem tra vi tien nguoi thang
			Optional<Wallet> wallet = walletRepository.findByIdUser(user.get().getId());
			if(!wallet.isPresent()) {
				result.put("errorx", "Buyer have not wallet");
				return result;
			}


			// tien dau gia cua nguoi choi
				Double bidMoney = (Double) bidHistoryRepository.maxMoney(productId).getOrDefault("maxx",0);
				if(wallet.get().getMoney()< bidMoney) {
					result.put("errorx", "Buyer have not money in wallet, please add money in wallet!");
					return result;
				}
			// kiem tra san pham co nguoi dau gia khong
			CompletableFuture<Void> completableFuture = CompletableFuture.runAsync(()->{

				// gui email cho nguoi thang
				EmailDetails BuyerEmailDetail = EmailDetails.builder()
						.recipient(user.get().getEmail())
						.subject("Purchase "+product.get().getProduct_name())
						.msgBody("You purchased success").build();
				;
				emailServiceImpl.sendSimpleMail(BuyerEmailDetail);

			}) ;

			System.out.println("Manually complete 1");

			// kiem tra san pham co nguoi dau gia khong
			CompletableFuture<Void> completableFuture2 = CompletableFuture.runAsync(()->{
				EmailDetails SellerEmailDetail = EmailDetails.builder()
						.recipient(product.get().getSeller().getEmail())
						.subject("Purchase "+product.get().getProduct_name())
						.msgBody(user.get().getFullname() +" purchased success "+product.get().getProduct_name()).build();
				// gui 	email cho nguoi ban
				emailServiceImpl.sendSimpleMail(SellerEmailDetail);
			}) ;


			;
			System.out.println("Manually complete 2");

			product.get().setProduct_status_id(ProductStatusEnum.PAID.getId());
			productRepository.save(product.get());
			Double money1 = wallet.get().getMoney()- bidMoney;
			wallet.get().setMoney(money1);
			walletRepository.save(wallet.get());

			//Tao lich su thanh toan
			History history = new History();
			history.setMoney(bidMoney);
			history.setProduct(product.get());
			history.setWallet(wallet.get());
			history.setMoneyPurpose(moneyPurposeRepository.
					findById(MoneyPurposeEnum.PAYED.getId()).get());
			historyRepository.save(history);
			Optional<Wallet> walletSeller = walletRepository.findByIdUser(product.get().getSeller().getId());
			try {
				walletSeller.ifPresent(wallet1 -> {
					wallet1.setMoney(wallet1.getMoney()+bidMoney);
				});

				walletRepository.save(walletSeller.get());

				//Tao lich su thanh toan
				History history2 = new History();
				history2.setMoney(bidMoney);
				history2.setProduct(product.get());
				history2.setWallet(walletSeller.get());
				history2.setMoneyPurpose(moneyPurposeRepository.
						findById(MoneyPurposeEnum.RECHARGE.getId()).get());
				historyRepository.save(history2);
			} catch (Exception e) {
				result.put("errorx","Seller have not wallet");
				return result;
			}

			result.put("products",productRepository.findPAIDProd(user.get().getId()));
			result.put("successx","Successfully Purchased");
		} catch (Exception e) {
			result.put("errorx", e.getMessage());
		}
		return  result;

	}




	@Override
	public JSONObject purchase1(int productId) {
		JSONObject result;
		try {
				result = new JSONObject();
//			Optional<Wallet> wallet = walletRepository.findByIdUser(user.get().getId());
			Optional<Product> product = productRepository.findById(productId);

			JSONObject buyerWallet = hwRepo.getWallet(product.get().getBuyer_id());
			JSONObject sellerWallet = hwRepo.getWallet(product.get().getSeller().getId());
			int sellerID = product.get().getSeller().getId();
			int buyerID = product.get().getBuyer_id();
			Optional<User> seller = userRepository.findById(sellerID);
			Optional<User> buyer = userRepository.findById(buyerID);


			Integer buyerWalletID = (Integer) buyerWallet.get("wallet_id");
			Integer sellerWalletID = (Integer) sellerWallet.get("wallet_id");
			Double bmoney = (Double)buyerWallet.get("money");
			Double smoney = (Double)sellerWallet.get("money");



			//		Integer winnerWallet = (Integer) wallet.get("wallet_id");
//			JSONObject json = new JSONObject(bhRepo.maxMoney(productId));
			Double max_bidx = (Double) bhRepo.maxMoney(productId).get("maxx");
			System.out.println(max_bidx);
			if((max_bidx + 50.0) >= bmoney){
				result.put("errorx", "Dont have enough money, you should consider topup!");
			}
			else{
				System.out.println(1111);
				SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date date = new Date(System.currentTimeMillis());

//				hwRepo.buyerPurchase(product.get().getBuyer_id(),max_bidx - 50.0);
				hwRepo.buyerPurchase(max_bidx,buyerWalletID);
				hwRepo.createHistory(formatter.format(date),max_bidx,3,productId,buyerWalletID);


				hwRepo.sellerPurchase(max_bidx,sellerWalletID);
				hwRepo.createHistory(formatter.format(date),max_bidx,4,productId,sellerWalletID);
//
				//admin topup 50.0
//				hwRepo.topUP(1,50.0);

				hwRepo.changeBidding(5,productId);

			result.put("successx","Successfully Purchased");
			result.put("products",findPaidProd(product.get().getBuyer_id()));

			}

			CompletableFuture<String> completableFuture = new CompletableFuture<>();


			// gui email cho nguoi thang
			EmailDetails BuyerEmailDetail = EmailDetails.builder()
					.recipient(buyer.get().getEmail())
					.subject("Purchase "+product.get().getProduct_name())
					.msgBody("Your product from auction succesfully bought.").build();
			;
			completableFuture.complete(emailServiceImpl.sendSimpleMail(BuyerEmailDetail));

			// kiem tra san pham co nguoi dau gia khong
			CompletableFuture<String> completableFuture2 = new CompletableFuture<>();
			// gui email cho nguoi ban
			EmailDetails SellerEmailDetail = EmailDetails.builder()
					.recipient(seller.get().getEmail())
					.subject("Your product been bought "+product.get().getProduct_name())
					.msgBody("User "+buyer.get().getFullname() +" succesfully bought your product name: "+product.get().getProduct_name()).build();
			completableFuture2.complete(emailServiceImpl.sendSimpleMail(SellerEmailDetail))
			;
			System.out.println("Manually complete 2");

			return result;
		} catch (Exception e) {

			return  null;
		}

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
