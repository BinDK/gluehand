package com.mvc.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping({""} )
public class Home {
    @RequestMapping(value = {"index"},method = RequestMethod.GET)
    public String Index(ModelMap modelMap){
//        modelMap.put("prods",productServ.findAll());
        return "demo/index";
    }
}
