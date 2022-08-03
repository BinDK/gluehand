package com.mvc.service.impl;

import com.mvc.entity.User;
import com.mvc.repository.BidHistoryRepository;
import com.mvc.service.BidHistoryServ;
import com.mvc.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BidHistoryImpl implements BidHistoryServ {

    @Autowired
    BidHistoryRepository repo;

    @Autowired
    UserService uss;

    @Override
    public JSONObject upWinnergetList(int prodID) {
        JSONObject result;
        try {
            result = new JSONObject();

            List<JSONObject> jsons = repo.checkBidBeforeUpdate(prodID);
            if(jsons.isEmpty() || jsons.size() <= 0){
                System.out.println(0);
                result.put("noti_number",0);

            }else{
                System.out.println(jsons);
                System.out.println(jsons.size());
                JSONObject getMaxBidWinner = repo.getWinner(prodID);
                User uj = uss.findID((Integer)getMaxBidWinner.get("buyer_id"));
                System.out.println("Begin IMPL "+ (Integer)getMaxBidWinner.get("buyer_id"));
                System.out.println(uj.getId());
                System.out.println("END impl");
                repo.updateWinner(uj.getId(),prodID);
                result.put("user",uj.getFullname());
            }
            result.put("max",repo.maxMoney(prodID));
            result.put("bidhistory",getBidHistory(prodID));

            return result;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return  null;
        }
    }

    @Override
    public JSONObject getWinnerx(int prodID) {

        try {
            JSONObject json = new JSONObject(repo.getWinner(prodID));
//            Double max = (Double) json.get("bidding_money");
            return json;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override

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
