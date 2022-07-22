package com.mvc.rest;

import com.mvc.entity.Category;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.helper.FileHelper;
import com.mvc.response.ResponseActionProduct;
import com.mvc.service.AdminService;
import com.mvc.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.util.List;
import java.util.Locale;

@RestController
@RequestMapping("adminapi")
public class AdminAjax implements ServletContextAware {
    private ServletContext servletContext;

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Autowired
    ProductService productService;

    @Autowired
    AdminService adminService;

    @PostMapping(value = "createcate")
    public ResponseEntity<Category> createcate(@RequestParam(value = "catename",required = true) String catename ) {
        try {
            Category cx = productService.createCate(catename);
                    if(cx != null){
            return new ResponseEntity<Category>(cx,HttpStatus.OK);

                    }else{
                        return new ResponseEntity<Category>((Category) null,HttpStatus.BAD_REQUEST);
                    }
        } catch (Exception e) {
            return new ResponseEntity<Category>((Category) null,HttpStatus.BAD_REQUEST);
        }
    }


    @GetMapping(value = "wallettransaction")
    public ResponseEntity<Integer> cancelProd(@RequestParam("id") int id) {

        try {
            System.out.println(id);
            return new ResponseEntity<Integer>(id,HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    /*
     * Action page of admin index
     */
    @RequestMapping(value = {"action"},method = RequestMethod.GET)
    public ResponseActionProduct action(@RequestParam String action,@RequestParam int id){
//        modelMap.put("prods",productServ.findAll());
        System.out.println(ProductStatusEnum.valueOf(action));
        ResponseActionProduct list = productService.actionProduct(ProductStatusEnum.valueOf(action.toUpperCase(Locale.ROOT)),id);
        return list;
    }

}
