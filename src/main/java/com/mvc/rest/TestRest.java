package com.mvc.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	
    @RequestMapping(value = {"test"},method = RequestMethod.GET)
    public List<Product> Index(){
//        modelMap.put("prods",productServ.findAll());
        return productService.listProductFilterStatus(ProductStatusEnum.ALL);
    }
}
