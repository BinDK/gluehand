package com.mvc.repository;

import com.mvc.entity.Category;
import com.mvc.entity.History;
import org.json.simple.JSONObject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

@Repository
public interface HistoryRepository extends JpaRepository<History, Integer> {
    @Query(value="SELECT  history.created, history.money AS total, money_purpose.status_name " +
            "FROM `history` " +
            "INNER JOIN wallet ON wallet.wallet_id = history.wallet_id " +
            "INNER JOIN money_purpose ON money_purpose.money_purpose_id = history.money_purpose " +
            "WHERE wallet.user_id = :userId " +
            "ORDER BY history.created DESC",nativeQuery= true)
    public List<JSONObject> getListHistoryByUserId(int userId);

//    @Query(value="",nativeQuery= true)
//    JSONObject getInformationWalletOfUser(int id);

    @Query(value="SELECT SUM(money) as total_money, money_purpose " +
            "FROM `history` WHERE  history.wallet_id = :wallet_id AND money_purpose = :id OR money_purpose = :id2 " +
            "GROUP BY money_purpose",nativeQuery= true)
    List<JSONObject> getMoneyWalletOfUser(int id, Integer wallet_id, int id2);
}
