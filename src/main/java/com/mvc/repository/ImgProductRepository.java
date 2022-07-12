package com.mvc.repository;

import com.mvc.entity.History;
import com.mvc.entity.ImgProduct;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ImgProductRepository extends JpaRepository<ImgProduct, Integer> {

}
