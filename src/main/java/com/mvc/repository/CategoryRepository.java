package com.mvc.repository;

import com.mvc.entity.BidHistory;
import com.mvc.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
