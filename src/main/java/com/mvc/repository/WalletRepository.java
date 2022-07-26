package com.mvc.repository;

import com.mvc.entity.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.*;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
@Repository
public interface WalletRepository extends JpaRepository<Wallet, Integer> {


    @Query(value = "select * from wallet where user_id = :id LIMIT 1",nativeQuery = true)
    Optional<Wallet> findByIdUser(int id);
}
