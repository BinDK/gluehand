package com.mvc.service.impl;

import java.util.List;
import java.util.Optional;

import com.mvc.ajaxentity.UserJ;
import com.mvc.entity.Wallet;
import com.mvc.repository.WalletRepository;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import com.mvc.entity.User;
import com.mvc.enums.ErrorEnum;
import com.mvc.enums.UserStatusEnum;
import com.mvc.repository.UserRepository;
import com.mvc.response.ResponseUser;
import com.mvc.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    WalletRepository walletrepo;

    @Override
    public UserJ signin(String uname, String pass) {
        return userRepository.signin(uname,pass);
    }

    @Override
    public ResponseUser createUser(User user) {
        ResponseUser res = new ResponseUser();
        res.setUser(userRepository.save(user));
        user.setIsAdmin(false);
        user.setUserStatus(1);
        res.setHasError(userRepository.save(user) == null ? false : true);
        return res;
    }

    @Override
    public User findID(int id) {
        return userRepository.findById(id).get();
    }

    @Override
    public Integer createUser1(User user) {
        try {
            user.setIsAdmin(false);
            user.setUserStatus(1);
            User u2 = userRepository.save(user);
            Wallet w = new Wallet();
            w.setUser(u2);
            w.setMoney(0.0);
            walletrepo.save(w);
            return u2.getId();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return 0;
    }

    @Override
    public Integer upUser(User user) {
        try {
            userRepository.save(user);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
            return 0;
    }

    @Override
    public boolean changepass(User user) {
        try {
            userRepository.save(user).getId();
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public ResponseUser updateUser(User user) {
        ResponseUser res = new ResponseUser();
        Optional<User> u = userRepository.findById(user.getId());
        validUser(u, res);
        res.setUser(userRepository.save(user));
        return res;
    }

    private void validUser(Optional<User> u, ResponseUser res) {
        if (!u.isPresent()) {
            res.setHasError(true);
            res.setError(ErrorEnum.NOT_FIND_USER.getName());
        }

        if (u.get().getIsAdmin()) {
            res.setHasError(true);
            ;
            res.setError(ErrorEnum.NOT_USER.getName());
        }
    }

    @Override
    public ResponseUser deleteUser(int id) {
        ResponseUser res = new ResponseUser();
        Optional<User> u = userRepository.findById(id);
        validUser(u, res);

        u.get().setUserStatus(UserStatusEnum.DELETE.getId());
        res.setUser(userRepository.save(u.get()));
        return res;
    }

    @Override
    public List<User> findAllUser() {
        return userRepository.findAll();
    }

    @Override
    public List<JSONObject> listUserNotBan(UserStatusEnum id) {
        switch (id) {
            case ACTIVE:
                return userRepository.findAllUser(id.getId());
        }
        return null;
    }


}
