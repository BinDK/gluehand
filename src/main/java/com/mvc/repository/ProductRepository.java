package com.mvc.repository;

import com.mvc.entity.ImgProduct;
import com.mvc.entity.Product;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "ORDER BY start_date DESC")
	List<Product> findProductNotApprove(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND NOW() < start_date "
			+ "ORDER BY start_date DESC")
	List<Product> findProductApprove(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND NOW() BETWEEN start_date AND end_date "
			+ "ORDER BY start_date DESC")
	List<Product> findProductBidding(int i);

	@Query(nativeQuery = true,value = "SELECT * FROM product WHERE product_status_id = :i "
			+ "AND NOW() > end_date "
			+ "ORDER BY start_date DESC")
	List<Product> findProductBidded(int i);

}
