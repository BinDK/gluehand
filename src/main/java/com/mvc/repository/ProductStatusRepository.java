package com.mvc.repository;

import com.mvc.entity.Product;
import com.mvc.entity.ProductStatus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductStatusRepository extends JpaRepository<ProductStatus, Integer> {

}
