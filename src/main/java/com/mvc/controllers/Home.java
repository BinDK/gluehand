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
        return "demo/index";
    }

    @RequestMapping(value = {"auction"},method = RequestMethod.GET)
    public String Auction(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "demo/auction";
    }
}
