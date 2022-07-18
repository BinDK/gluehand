package com.mvc.repository;

import com.mvc.entity.ImgProduct;
import com.mvc.entity.Product;

import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductNotApprove(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND NOW() < start_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductApprove(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND NOW() BETWEEN start_date AND end_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductBidding(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND NOW() > end_date "
			+ "ORDER BY start_date DESC")
	List<JSONObject> findProductBidded(int i);

	@Query(nativeQuery = true,value =
			"SELECT product_id, product_status_id, CASE " +
			" WHEN NOW() BETWEEN start_date AND end_date AND product_status_id = :statusApprove THEN :nameApprove " +
			" WHEN NOW() > end_date AND product_status_id = 1 THEN \"ket thuc dau gia\" " +
			" WHEN NOW() < start_date AND product_status_id = 1 THEN \"da duyet\" " +
			" WHEN product_status_id = 0 THEN \"Chua duyet\" " +
			" ELSE \"da thanh toan\" " +
			"END AS \"status\" FROM product ")
    List<JSONObject> findAllProduct(int statusApprove, String nameApprove);
}
