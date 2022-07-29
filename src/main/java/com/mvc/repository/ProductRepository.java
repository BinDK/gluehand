package com.mvc.repository;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.ajaxentity.UserJ;
import com.mvc.entity.ImgProduct;
import com.mvc.entity.Product;

import java.util.List;
import java.util.Optional;

import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query(nativeQuery = true,value = "" +
			"SELECT product.product_id, product.product_name, user.fullname, category.name as category, " +
			"product.start_date, product.end_date, product.price_minium, product.price_step " +
			"FROM product " +
			"INNER JOIN user on user.user_id = product.seller_id " +
			"INNER JOIN category on category.id = product.category_id " +
			"WHERE product.product_status_id = :i AND convert_tz(now(),@@session.time_zone,'+07:00') < product.start_date " +
			"ORDER BY product.start_date DESC")
	List<JSONObject> findProductNotApprove(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND convert_tz(now(),@@session.time_zone,'+07:00') < start_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductApprove(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND convert_tz(now(),@@session.time_zone,'+07:00') BETWEEN start_date AND end_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductBidding(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND convert_tz(now(),@@session.time_zone,'+07:00') > end_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductBidded(int i);

	@Query(nativeQuery = true,value =
			"SELECT product_id, product_status_id, CASE " +
			" WHEN convert_tz(now(),@@session.time_zone,'+07:00') BETWEEN start_date AND end_date AND product_status_id = :statusApprove THEN :nameApprove " +
			" WHEN convert_tz(now(),@@session.time_zone,'+07:00') > end_date AND product_status_id = 1 THEN \"ket thuc dau gia\" " +
			" WHEN convert_tz(now(),@@session.time_zone,'+07:00') < start_date AND product_status_id = 1 THEN \"da duyet\" " +
			" WHEN product_status_id = 0 THEN \"Chua duyet\" " +
			" ELSE \"da thanh toan\" " +
			"END AS \"status\" FROM product ")
    List<JSONObject> findAllProduct(int statusApprove, String nameApprove);

	@Query(nativeQuery = true,value = "" +
			"SELECT product.product_id, product.product_name, user.fullname, category.name as category, " +
			"product.start_date, product.end_date, product.price_minium " +
			"FROM product " +
			"INNER JOIN user on user.user_id = product.seller_id " +
			"INNER JOIN category on category.id = product.category_id " +
			"WHERE product.product_status_id = :id AND convert_tz(now(),@@session.time_zone,'+07:00') < product.start_date " +
			"AND (0 = :cateid OR product.category_id = :cateid) " +
			"ORDER BY product.start_date DESC")
	List<JSONObject> findProductNotApproveFilterCategory(int id, int cateid);


	//Của BÌnh

//	@Query("from Product where buyer_id = :buyer_id")
	@Query(value = "" +
			"SELECT * FROM product p " +
			"LEFT JOIN user ON user.user_id = p.buyer_id " +
			"where p.buyer_id = :buyer_id",nativeQuery = true)
	public List<JSONObject> findPAIDProd(@Param("buyer_id")int buyer_id);


	@Query(nativeQuery = true,value = "" +
			"SELECT * FROM product p " +
			"LEFT JOIN img_product ON img_product.productx_id 	= p.product_id " +
			"WHERE p.product_status_id = :statuss and DATE(:datenow) <= DATE(p.start_date) and DATE(:datenow) <= DATE(p.end_date) " +
			"AND (0 = :cateid OR p.category_id = :cateid) " +
			"GROUP BY p.product_id")

	List<JSONObject> ProdWithCategory(@Param("statuss")int statuss,@Param("datenow")String datenow,@Param("cateid") int cateid);
	@Query(nativeQuery = true,value = "" +
			"SELECT * FROM product p " +
			"LEFT JOIN img_product ON img_product.productx_id 	= p.product_id " +
			"WHERE p.product_status_id = :statuss and DATE(:datenow) <= DATE(p.end_date) " +
			"GROUP BY p.product_id")
	public List<JSONObject> findProdJ(@Param("statuss")int statuss,@Param("datenow")String datenow);

	@Query(value = "" +
			"SELECT * FROM product p " +
			"LEFT JOIN img_product ON img_product.productx_id = p.product_id " +
			"WHERE p.product_id = :statuss GROUP BY p.product_id "
			,nativeQuery = true)
	public JSONObject findProd(@Param("statuss")int statuss);

	@Query(value = "UPDATE product p SET p.product_status_id = :statuss WHERE p.product_id = :idProd "
			,nativeQuery = true)
	public JSONObject changeBidding(@Param("statuss")int statuss,@Param("idProd")int idProd);

//	@Query("from Product left join ImgProduct on ImgProduct.product.id = Product.id where Product.product_status_id = :statuss")
//	public List<JSONObject> findProdJ(@Param("statuss")int statuss);


	@Query(nativeQuery = true,value = "" +
			"SELECT product.product_id, product.product_name, user.fullname, category.name as category, " +
			"product.start_date, product.end_date, product.price_minium, product.price_step " +
			"FROM product " +
			"INNER JOIN user on user.user_id = product.seller_id " +
			"INNER JOIN category on category.id = product.category_id " +
			"WHERE product.product_status_id = :i AND product.seller_id = :uidd AND convert_tz(now(),@@session.time_zone,'+07:00') < product.start_date " +
			"ORDER BY product.start_date DESC")
	List<JSONObject> findProductNotApprovexx(int i, int uidd);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND convert_tz(now(),@@session.time_zone,'+07:00') < start_date AND product.seller_id = :uidd "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductApprovexx(int i,int uidd);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND convert_tz(now(),@@session.time_zone,'+07:00') AND product.seller_id = :uidd BETWEEN start_date AND end_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductBiddingxx(int i,int uidd);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND convert_tz(now(),@@session.time_zone,'+07:00') > end_date AND product.seller_id :uidd "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductBiddedxx(int i,int uidd);


}

