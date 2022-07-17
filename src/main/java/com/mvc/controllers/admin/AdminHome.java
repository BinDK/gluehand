package com.mvc.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping({"admin"} )
public class AdminHome {
    @RequestMapping(value = {"index",""},method = RequestMethod.GET)
    public String Index(ModelMap modelMap, HttpSession session){
        return "admin/index";
    }

    @RequestMapping(value = {"users"},method = RequestMethod.GET)
    public String Users(ModelMap modelMap, HttpSession session){
        return "admin/users";
    }

    @RequestMapping(value = {"register"},method = RequestMethod.GET)
    public String register(ModelMap modelMap, HttpSession session){
//        modelMap.put("prods",productServ.findAll());
//        session.setAttribute("acc",12);
        return "admin/register_user";
    }

}
