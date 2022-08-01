package com.mvc.service;

import org.json.simple.JSONObject;

public interface HistoryWalletServ {
    public JSONObject topUp(int userID, double money);
    public JSONObject productPAID(int userID, double money);

}
