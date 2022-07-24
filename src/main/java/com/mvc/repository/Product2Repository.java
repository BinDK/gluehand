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

    @Query("select new com.mvc.ajaxentity.ProductJ(p.id,p.seller,p.product_name ,p.price_minium,p.start_date, p.end_date,p.product_status_id ,p.price_step,p.category_id ,p.fee)from Product p where p.product_status_id = :id")
//    @Query("from Product where product_status_id = :id")
    public List<ProductJ> findProdJx(@Param("id") int id);
}
