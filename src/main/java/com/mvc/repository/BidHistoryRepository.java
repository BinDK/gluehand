package com.mvc.repository;
import org.springframework.data.jpa.repository.*;
import com.mvc.entity.BidHistory;

public interface BidHistoryRepository extends JpaRepository<BidHistory, Integer> {

}
