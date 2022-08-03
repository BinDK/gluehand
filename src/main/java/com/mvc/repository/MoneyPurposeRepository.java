package com.mvc.repository;

import com.mvc.entity.MoneyPurpose;
import com.mvc.entity.Wallet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MoneyPurposeRepository extends JpaRepository<MoneyPurpose, Integer> {

}
