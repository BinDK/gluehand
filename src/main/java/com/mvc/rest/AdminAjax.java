package com.mvc.rest;

import com.mvc.entity.Category;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.helper.FileHelper;
import com.mvc.request.EmailDetails;
import com.mvc.response.ResponseActionProduct;
import com.mvc.service.AdminService;
import com.mvc.service.EmailService;
import com.mvc.service.ProductService;
import com.mvc.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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

    @Autowired
    UserService userService;

    @Autowired
    EmailService emailService;

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
    public JSONObject wallettransaction(@RequestParam("id") int id) {

        try {
            System.out.println(id);
            return userService.getListHistoryById(id);
        } catch (Exception e) {
            return null;
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

    @RequestMapping(value = {"index",""},method = RequestMethod.GET)
    public List<JSONObject> Index(ModelMap modelMap, HttpSession session, @RequestParam(required = false, defaultValue = "0") int cateid){
        List<JSONObject> result = productService.listProductFilterStatusHaveCateGory(ProductStatusEnum.NOT_APPROVE,cateid);

        return result;
    }

    @RequestMapping(value = {"email"},method = RequestMethod.GET)
    public String email(ModelMap modelMap, HttpSession session, EmailDetails emailDetails){

        return emailService.sendSimpleMail(emailDetails);
    }

}
