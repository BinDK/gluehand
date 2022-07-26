package com.mvc.service;

import com.mvc.entity.ImgProduct;
import com.mvc.entity.User;
import com.mvc.response.ResponseUser;
import org.json.simple.JSONObject;

import java.util.List;

public interface GeneralService {
    public ResponseUser login(User admin);
    public int matchuname(String uname);
    public ResponseUser signup(User admin);

    public List<JSONObject> ProdIMG(int id);
}
