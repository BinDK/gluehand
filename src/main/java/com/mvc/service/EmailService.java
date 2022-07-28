package com.mvc.service;

import com.mvc.entity.User;
import com.mvc.request.EmailDetails;
import com.mvc.response.ResponseUser;
import org.json.simple.JSONObject;

import java.util.List;

public interface EmailService {
    String sendSimpleMail(EmailDetails details);

    // Method
    // To send an email with attachment
    String sendMailWithAttachment(EmailDetails details);
}
