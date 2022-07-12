package com.mvc.repository;

import com.mvc.entity.ProductStatus;
import com.mvc.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {

}
