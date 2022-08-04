package com.mvc.service.impl;

import com.mvc.repository.HistoryWalletRepo;
import com.mvc.service.HistoryWalletServ;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class HistoryWalletServImpl implements HistoryWalletServ {

    @Autowired
    HistoryWalletRepo repo;

    @Override
    public JSONObject getW(int userID) {
        JSONObject res;
        try {
            res = new JSONObject();
            JSONObject wallet = repo.getWallet(userID);
            Integer walletID = (Integer) wallet.get("wallet_id");
            Double balance = (Double) wallet.get("money");
            res.put("histories", (List<JSONObject>)repo.getPersonHistory(walletID));
            res.put("topup",repo.sumTopup(walletID,1));
            res.put("paid",repo.sumPaid(walletID,3));
            res.put("balance",balance);


            return  res;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public JSONObject topUp(int userID, double money) {
            JSONObject res;
        try {
            res = new JSONObject();
            JSONObject wallet = repo.getWallet(userID);
            Integer walletID = (Integer) wallet.get("wallet_id");


            SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date(System.currentTimeMillis());

            repo.topUP(userID,money);
            repo.createHistory(formatter.format(date),money,1, null,walletID);

            res.put("histories", (List<JSONObject>)repo.getPersonHistory(walletID));
            res.put("topup",repo.sumTopup(walletID,1));
            res.put("paid",repo.sumPaid(walletID,3));
            JSONObject wallet2 = repo.getWallet(userID);
            Double balance = (Double) wallet2.get("money");
            res.put("balance",balance);
            return  res;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public JSONObject productPAID(int userID, double money) {
        return null;
    }
}
