package com.mvc.repository;

import com.mvc.entity.ImgProduct;
import com.mvc.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
