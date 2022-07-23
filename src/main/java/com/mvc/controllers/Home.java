package com.mvc.controllers;

import com.mvc.service.ProductService;
import com.mvc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping({""} )
public class Home {
    @Autowired
    UserService service;

    @Autowired
    ProductService prodservice;


    @RequestMapping(value = {"index",""},method = RequestMethod.GET)
    public String Index(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "user/index";
    }

    @RequestMapping(value = {"user/home"},method = RequestMethod.GET)
    public String Index2(ModelMap modelMap, HttpSession session, @RequestParam("id") int id){
//        modelMap.put("prods",productServ.findAll());
        session.setAttribute("acc",service.findID(id));
        session.setAttribute("accx","xxx");

        return "redirect:/index";

    }

    @RequestMapping(value = {"user/center"},method = RequestMethod.GET)
    public String Center(ModelMap modelMap, HttpSession session){
        return "user/center";
    }
    @RequestMapping(value = {"user/auction"},method = RequestMethod.GET)
    public String Auction(ModelMap modelMap, HttpSession session){
        return "user/auction";
    }

    @RequestMapping(value = {"user/manage"},method = RequestMethod.GET)
    public String Manage(ModelMap modelMap, HttpSession session){
        modelMap.put("cates",prodservice.findALlCate());
        return "user/manage";
    }

    @RequestMapping(value = {"user/logout","logout"},method = RequestMethod.GET)
    public String Logout(ModelMap modelMap, HttpSession session){
        session.removeAttribute("acc");
        return "redirect:/index";
    }

}
