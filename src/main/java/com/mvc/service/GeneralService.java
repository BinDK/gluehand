package com.mvc.service;

import com.mvc.entity.User;
import com.mvc.response.ResponseUser;

public interface GeneralService {
    public ResponseUser login(User admin);
    public int matchuname(String uname);
    public ResponseUser signup(User admin);
}
