package com.mvc.repository;
import org.springframework.data.jpa.repository.*;
import com.mvc.entity.BidHistory;
import org.springframework.stereotype.Repository;

@Repository
public interface BidHistoryRepository extends JpaRepository<BidHistory, Integer> {

}
