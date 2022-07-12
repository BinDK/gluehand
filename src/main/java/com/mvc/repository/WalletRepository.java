package com.mvc.repository;

import com.mvc.entity.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.*;


public interface WalletRepository extends JpaRepository<Wallet, Integer> {

}
