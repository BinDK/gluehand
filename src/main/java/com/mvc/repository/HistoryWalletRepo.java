package com.mvc.repository;

import com.mvc.entity.History;
import com.mvc.entity.Wallet;
import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface HistoryWalletRepo extends CrudRepository<History,Integer> {

//Add

    @Modifying
    @Query(value = "" +
            "UPDATE `wallet` SET `money` = `money` + ?2 WHERE `wallet`.`user_id` = ?1 ",nativeQuery = true)
        void topUP(int userID, double money);

    @Modifying
    @Query(value = "" +
            "UPDATE `wallet` SET `money` = `money` - ?1 WHERE `wallet`.`wallet_id` = ?2 ",nativeQuery = true)
    void buyerPurchase(double money,int walletID);

    @Modifying
    @Query(value = "" +
            "UPDATE `wallet` SET `money` = `money` + ?1  WHERE `wallet`.`wallet_id` = ?2 ",nativeQuery = true)
    void sellerPurchase(double money,int walletID);

    @Modifying
    @Query(value = "" +
            "UPDATE `product` SET `product_status_id` = ?2  WHERE `product`.`product_id` = ?1 ",nativeQuery = true)
    void changeProd(int prodID, double money);


    @Modifying
    @Query(value = "" +
            "INSERT INTO `history`(`created`, `money`, `money_purpose`, `product_id`, `wallet_id`) VALUES (?1,?2,?3,?4,?5) ",nativeQuery = true)
        void createHistory(String datex, double money,int purpose,Integer prodID,int walletID);

    @Modifying
    @Query(value = "" +
            "INSERT INTO `history`(`created`, `money`, `money_purpose`, `product_id`, `wallet_id`) VALUES (?1,?3,3,?4,?2)",nativeQuery = true)
    void createPAIDHistory(String datex,int walletID, double money,int prodID);


//Search
    @Query(value = "" +
            "SELECT * FROM `wallet` WHERE `wallet`.`user_id` = ?1 ",nativeQuery = true)
    JSONObject getWallet(int userID);


    @Query(value = "" +
            "SELECT `history`.*, `product`.`product_name`" +
            "FROM `history`" +
            "LEFT JOIN `product` on `product`.product_id = `history`.`product_id`" +
            "WHERE `history`.`wallet_id` = ?1 ORDER BY `history`.`created` DESC",nativeQuery = true)
    List<JSONObject> getPersonHistory(int walletID);

    @Query(value = "" +
            "SELECT SUM(money) as sumt FROM `history` WHERE `history`.`wallet_id` = ?1 and `history`.`money_purpose` = ?2 ",nativeQuery = true)
    JSONObject sumTopup(int walletID,int purpose);
    @Query(value = "" +
            "SELECT SUM(money) as sump FROM `history` WHERE `history`.`wallet_id` = ?1 and `history`.`money_purpose` = ?2",nativeQuery = true)
    JSONObject sumPaid(int walletID,int purpose);


    @Modifying
    @Query(value = "UPDATE product  SET `product_status_id` = ?1 WHERE `product_id` = ?2 "
            ,nativeQuery = true)
    void changeBidding(int statuss,int idProd);

}
