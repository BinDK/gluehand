package com.mvc.repository;
import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.*;
import com.mvc.entity.BidHistory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface BidHistoryRepository extends CrudRepository<BidHistory, Integer> {

    @Query(value="SELECT * " +
            "FROM bid_history bh " +
            "LEFT JOIN user u ON u.user_id = bh.buyer_id " +
            "WHERE  bh.product_id = :prodID " +
            "ORDER BY bh.bidding_money DESC",nativeQuery= true)
    List<JSONObject> getBidHIstory(int prodID);


//    @Query("from BidHistory where product.id = :prodID ")
//    Iterable<BidHistory> getBidHIstory(int prodID);


    @Modifying
    @Query(value = "insert into bid_history (product_id,buyer_id,bidding_money) VALUES (?1, ?2, ?3)", nativeQuery = true)
    void nativeInserBID(int prodID, int userID,double money);

    @Query(value = "SELECT * FROM `bid_history` WHERE product_id = ?1 ORDER BY bidding_money DESC LIMIT 1", nativeQuery = true)
    JSONObject getWinner(int prodID);

    @Modifying
    @Query(value = "UPDATE `product` SET `buyer_id` = ?1 WHERE `product`.`product_id` =  ?2", nativeQuery = true)
    void updateWinner(int buyerID,int prodID);

    @Query(value = "SELECT * FROM `bid_history` WHERE product_id = ?1 ", nativeQuery = true)
    List<JSONObject> checkBidBeforeUpdate(int prodID);


    @Query(value = "select MAX(bidding_money) as maxx from bid_history bh where product_id = ?1", nativeQuery = true)
    JSONObject maxMoney(int prodID);
}
