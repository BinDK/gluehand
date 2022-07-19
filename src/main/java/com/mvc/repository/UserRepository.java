package com.mvc.repository;

import com.mvc.entity.ProductStatus;
import com.mvc.entity.User;
import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query(nativeQuery = true,value = "SELECT  " +
            "user.user_id, user.fullname, user.user_name, wallet.money " +
            "FROM `user` " +
            "INNER JOIN wallet ON wallet.user_id = user.user_id " +
            "WHERE user.user_status = :id " +
            "ORDER BY user.user_id DESC")
    List<JSONObject> findAllUser(int id);
}
