package com.mvc.controllers;

import com.mvc.entity.User;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.service.GeneralService;
import com.mvc.service.Product2Service;
import com.mvc.service.ProductService;
import com.mvc.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping({""} )
public class Home {
    @Autowired
    UserService service;

    @Autowired
    ProductService prodservice;

    @Autowired
    Product2Service prodservice2;

    @Autowired
    GeneralService generalService;

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

        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        System.out.println(formatter.format(date));

        modelMap.put("prods",prodservice.findProdJ(1,formatter.format(date)));
        return "user/center";
    }
    @RequestMapping(value = {"user/auction"},method = RequestMethod.GET)
    public String Auction(@RequestParam("id") int prodID, ModelMap modelMap, HttpSession session){
        modelMap.put("imgxs",generalService.ProdIMG(prodID));
        modelMap.put("prod",prodservice.findProd(prodID));
        return "user/auction";
    }

    @RequestMapping(value = {"user/manage"},method = RequestMethod.GET)
    public String Manage(ModelMap modelMap, HttpSession session){
        if (session.getAttribute("acc") != null){
            User u = (User) session.getAttribute("acc");
            if(u.getIsAdmin() == false){
                modelMap.put("cates",prodservice.findALlCate());
                return "user/manage";

            } else{
                return "redirect:/index";
            }

        }else {
            return "redirect:/index";

        }
    }

    @RequestMapping(value = {"user/logout","logout"},method = RequestMethod.GET)
    public String Logout(ModelMap modelMap, HttpSession session){
        session.removeAttribute("acc");
        return "redirect:/index";
    }

}
