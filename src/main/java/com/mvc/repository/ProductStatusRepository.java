package com.mvc.repository;

import com.mvc.entity.Product;
import com.mvc.entity.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductStatusRepository extends JpaRepository<ProductStatus, Integer> {

}
