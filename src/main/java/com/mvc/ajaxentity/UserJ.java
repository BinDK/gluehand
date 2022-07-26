package com.mvc.ajaxentity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserJ {
    private int id;
    private String userName;
    private String password;
    private String fullname;
    private String address;
    private String email;
    private int userStatus;
    private String phone;
    private boolean isAdmin;
}