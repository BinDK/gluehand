package com.mvc.repository;

import com.mvc.ajaxentity.UserJ;
import com.mvc.entity.ProductStatus;
import com.mvc.entity.User;
import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select count(id) from User where userName = :uname")
    public int checkuanme(@Param("uname")String uname);

    @Query("select new com.mvc.ajaxentity.UserJ(id,userName,password,fullname,address,email,userStatus,phone,isAdmin) from User where userName = :uname")
    public UserJ findByUsername(@Param("uname")String uname);

    @Query("select new com.mvc.ajaxentity.UserJ(id,userName,password,fullname,address,email,userStatus,phone,isAdmin) from User where userName = :uname and password = :pass")
    public UserJ signin(@Param("uname")String uname, @Param("pass")String pass);

    @Query("select new com.mvc.ajaxentity.UserJ(id,userName,password,fullname,address,email,userStatus,phone,isAdmin) from User where userName = :uname")
    public UserJ getUserJ(@Param("uname")String uname);

    @Query(nativeQuery = true,value = "SELECT  " +
            "user.user_id, user.fullname, user.user_name, wallet.money " +
            "FROM `user` " +
            "INNER JOIN wallet ON wallet.user_id = user.user_id " +
            "WHERE user.user_status = :id " +
            "ORDER BY user.user_id DESC")
    List<JSONObject> findAllUser(int id);
}
