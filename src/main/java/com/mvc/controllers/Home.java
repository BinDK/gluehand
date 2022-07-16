package com.mvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping({""} )
public class Home {
    @RequestMapping(value = {"index",""},method = RequestMethod.GET)
    public String Index(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "user/index";
    }

    @RequestMapping(value = {"user/center"},method = RequestMethod.GET)
    public String Center(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "user/center";
    }
    @RequestMapping(value = {"user/auction"},method = RequestMethod.GET)
    public String Auction(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "user/auction";
    }

    @RequestMapping(value = {"user/manage"},method = RequestMethod.GET)
    public String Manage(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "user/manage";
    }

}
