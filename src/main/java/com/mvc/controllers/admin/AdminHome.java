package com.mvc.controllers.admin;

import com.mvc.enums.ProductStatusEnum;
import com.mvc.service.AdminService;
import com.mvc.service.ProductService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping({"admin"} )
public class AdminHome {

    @Autowired
    ProductService productService;

    @Autowired
    AdminService adminService;

    @RequestMapping(value = {"index",""},method = RequestMethod.GET)
    public String Index(ModelMap modelMap, HttpSession session){
        List<JSONObject> result = productService.listProductFilterStatus(ProductStatusEnum.NOT_APPROVE);
//        modelMap.addAttribute("products", result);
        modelMap.put("products",result);
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
