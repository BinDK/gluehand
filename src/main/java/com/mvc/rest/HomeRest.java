package com.mvc.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping({"/api"} )
public class HomeRest {

    @RequestMapping(value = {"index"},method = RequestMethod.GET)
    public String Index(){
//        modelMap.put("prods",productServ.findAll());
        return "demo/index";
    }
}
