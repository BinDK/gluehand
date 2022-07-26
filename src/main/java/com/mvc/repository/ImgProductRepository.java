package com.mvc.repository;

import com.mvc.entity.History;
import com.mvc.entity.ImgProduct;
import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImgProductRepository extends JpaRepository<ImgProduct, Integer> {
    @Query(nativeQuery = true,value = "select * from img_product " +
            "where img_product.productx_id = :idx")
    public List<JSONObject> productimggg(@Param("idx") int idx);
}
