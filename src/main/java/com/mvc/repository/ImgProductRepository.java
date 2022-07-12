package com.mvc.repository;

import com.mvc.entity.History;
import com.mvc.entity.ImgProduct;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ImgProductRepository extends JpaRepository<ImgProduct, Integer> {

}
