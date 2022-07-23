package com.mvc.repository;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.entity.Product;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Product2Repository extends CrudRepository<Product,Integer> {
//    @Query("select new com.mvc.ajaxentity.ProductJ(id,seller,product_name ,price_minium,start_date, end_date,product_status_id ,price_step,category_id ,fee)from Product where product_status_id = :id")

//    @Query("from Product where product_status_id = :id")
//    public Iterable<ProductJ> findProdJx(@Param("id") int id, @Param("uidd")int uidd);
}
