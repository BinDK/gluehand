package com.mvc.service.impl;

import com.mvc.entity.BidHistory;
import com.mvc.repository.BidHistoryRepository;
import com.mvc.service.BidHistoryServ;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BidHistoryImpl implements BidHistoryServ {

    @Autowired
    BidHistoryRepository repo;

    @Override
//    public Iterable<BidHistory> getBidHistory(int prodID) {
//        return repo.getBidHIstory(prodID);
//    }
    public List<JSONObject> getBidHistory(int prodID) {
        return repo.getBidHIstory(prodID);
    }

    public JSONObject getMax(int prodID) {
//        JSONObject result;
        try {
//            result = new JSONObject();
//            result.put("maxx",repo.maxMoney(prodID));

            return repo.maxMoney(prodID);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return  null;
        }
    }
        public JSONObject getListandMax(int prodID) {
        JSONObject result;
        try {
            result = new JSONObject();
            result.put("max",repo.maxMoney(prodID));
            result.put("bidhistory",getBidHistory(prodID));

            return result;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return  null;
        }
    }
    public JSONObject bidAndGetList2(int prodID,int userID,double money) {

        JSONObject result;
        try {
            repo.nativeInserBID(prodID,userID,money);
                result = new JSONObject();
        result.put("max",repo.maxMoney(prodID));
        result.put("bidhistory",getBidHistory(prodID));

            return result;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return  null;
        }
    }

}
