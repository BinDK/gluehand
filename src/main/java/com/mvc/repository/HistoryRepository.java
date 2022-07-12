package com.mvc.repository;

import com.mvc.entity.Category;
import com.mvc.entity.History;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HistoryRepository extends JpaRepository<History, Integer> {

}
