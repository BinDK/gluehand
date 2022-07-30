package com.mvc.service;

import com.mvc.entity.BidHistory;
import org.json.simple.JSONObject;

import java.util.List;

public interface BidHistoryServ {

    public List<JSONObject> getBidHistory(int prodID);
    public JSONObject bidAndGetList2(int prodID,int userID,double money);
    public JSONObject getListandMax(int prodID);

    public JSONObject getMax(int prodID);
    }
