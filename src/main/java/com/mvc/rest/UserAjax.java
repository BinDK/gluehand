package com.mvc.rest;

import com.mvc.ajaxentity.UserJ;
import com.mvc.entity.User;
import com.mvc.helper.FileHelper;
import com.mvc.response.ResponseUser;
import com.mvc.service.GeneralService;
import com.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("api")
public class UserAjax implements ServletContextAware {
    private ServletContext servletContext;
    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Autowired
    GeneralService service;

    @Autowired
    UserService uservice;


    @DeleteMapping(value = "upload")
    public ResponseEntity<Boolean> handleFileUpload(@RequestParam(value = "files",required = false) MultipartFile[] files ) {
        try {
            for(MultipartFile file : files) {
                System.out.println("file Name: " + file.getName());
                System.out.println("file Orginal Name: " + file.getOriginalFilename());
                System.out.println("file size: " + file.getSize());
                System.out.println("file type: " + file.getContentType());
                String fileName = FileHelper.upload(servletContext, file);
            }
            return new ResponseEntity<Boolean>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
        }
    }


    @GetMapping(value = "cancelprod")
    public ResponseEntity<Boolean> cancelProd(@RequestParam("id") int id) {

        try {
            System.out.println(id);
            return new ResponseEntity<Boolean>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "matchuname")
    public ResponseEntity<Integer> MatchUname(@RequestParam("uname") String uname) {
        try {
            int hold = service.matchuname(uname);
            return new ResponseEntity<Integer>(hold,HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "signin",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<UserJ> Signin(@RequestParam("uname") String uname, @RequestParam("pass") String pass) {
        try {

            return new ResponseEntity<UserJ>(uservice.signin(uname,pass),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<UserJ>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = "createuser",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Integer> Signup(@RequestParam("uname") String uname,@RequestParam("pass") String pass) {
        try {
            User u = new User();
            u.setUserName(uname);
            u.setPassword(pass);
            return new ResponseEntity<Integer>(uservice.createUser1(u),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping(value = "updateacc",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Integer> Update(
            @RequestParam("accF") String accF,
            @RequestParam("accE") String accE,
            @RequestParam("accP") String accP, HttpSession session){
        try {
            User u = (User) session.getAttribute("acc");
            System.out.println(u.getId()+ " -- " + u.getUserName());
            User u2 = uservice.findID(u.getId());
            u2.setFullname(accF);
            u2.setEmail(accE);
            u2.setPhone(accP);

            return new ResponseEntity<Integer>(uservice.upUser(u2),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping(value = "changepass",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Boolean> Update(
            @RequestParam("pass") String pass, HttpSession session){
        try {
            User u = (User) session.getAttribute("acc");
            User u2 = uservice.findID(u.getId());
            u2.setPassword(pass);
            return new ResponseEntity<Boolean>(uservice.changepass(u2),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
        }
    }

}
