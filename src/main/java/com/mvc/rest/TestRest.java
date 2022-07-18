package com.mvc.rest;

import java.util.List;

import com.mvc.service.AdminService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mvc.entity.Product;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.service.ProductService;

@RestController
@RequestMapping({"api"} )
public class TestRest {

	@Autowired
	ProductService productService;

    @Autowired
    AdminService adminService;

    @RequestMapping(value = {"test"},method = RequestMethod.GET)
    public List<JSONObject> Index(){
//        modelMap.put("prods",productServ.findAll());
        List<JSONObject> list = productService.listProductFilterStatus(ProductStatusEnum.ALL);
        return list;
    }


}
