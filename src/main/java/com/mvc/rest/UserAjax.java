package com.mvc.rest;

import com.mvc.ajaxentity.ProductJ;
import com.mvc.ajaxentity.UserJ;
import com.mvc.entity.ImgProduct;
import com.mvc.entity.Product;
import com.mvc.entity.User;
import com.mvc.enums.ProductStatusEnum;
import com.mvc.enums.UserStatusEnum;
import com.mvc.helper.FileHelper;
import com.mvc.response.ResponseActionProduct;
import com.mvc.service.GeneralService;
import com.mvc.service.Product2Service;
import com.mvc.service.ProductService;
import com.mvc.service.UserService;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

@RestController
@RequestMapping("api")
public class UserAjax implements ServletContextAware {
    private ServletContext servletContext;

    @Autowired
    UserService userService;

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @Autowired
    GeneralService service;

    @Autowired
    UserService uservice;

    @Autowired
    ProductService productService;
//
//    @Autowired
//    Product2Service productService2;


//Add , cancel( khi chưa được duyệt), list product theo status chưa duyệt
    @PostMapping(value = "upload")
    public ResponseEntity<Boolean> handleFileUpload(@RequestParam(value = "files",required = false) MultipartFile[] files, @RequestParam("prodID") int prodID) {
        try {
            for(MultipartFile file : files) {
                System.out.println("file Name: " + file.getName());
                System.out.println("file Orginal Name: " + file.getOriginalFilename());
                System.out.println("file size: " + file.getSize());
                System.out.println("file type: " + file.getContentType());
                String fileName = FileHelper.upload(servletContext, file);
                ImgProduct img = new ImgProduct();
                img.setImg(fileName);
                Product prod1 = new Product();prod1.setId(prodID);
                img.setProductx(prod1);
                productService.uploadImg(img);
            }
            return new ResponseEntity<Boolean>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = "addproduct",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Integer> Addproduct(
            @RequestParam("prodName") String prodName,
            @RequestParam("prodPrice") String prodPrice,
            @RequestParam("prodStep") String prodStep,
            @RequestParam("prodsDate") String prodsDate,
            @RequestParam("prodeDate") String prodeDate,
            @RequestParam("prodCate") String prodCate,
            @RequestParam("userid") String userid) {
        try {
            Product prod = new Product();
//            LocalDateTime currentDateTime = LocalDateTime.now();
//            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date s = new java.sql.Date(df.parse(prodsDate).getTime());
            Date e = new java.sql.Date(df.parse(prodeDate).getTime());

            prod.setProduct_name(prodName);
            prod.setPrice_minium(Double.parseDouble(prodPrice));
            prod.setPrice_step(Double.parseDouble(prodStep));
            prod.setStart_date(s);
            prod.setEnd_date(e);
            prod.setCategory_id(Integer.parseInt(prodCate));
            prod.setSeller(uservice.findID(Integer.parseInt(userid)));
            prod.setFee(50);
            prod.setProduct_status_id(0);
            prod.setBuyer_id(0);
            return new ResponseEntity<Integer>( productService.create(prod),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping(value = "cancelprod")
    public ResponseEntity<Boolean> cancelProd(@RequestParam("id") int id) {

        try {
            System.out.println(id);
            return new ResponseEntity<Boolean>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
        }
    }


//    @GetMapping(value = "centerprod",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
//    public ResponseEntity<List<JSONObject>> CenterProd(@RequestParam("statuss") int statuss){
//        try {
//
//                return new ResponseEntity<List<JSONObject>>(productService.findProdJ(statuss),HttpStatus.OK);
//
//
//        } catch (Exception e) {
//            return new ResponseEntity<List<JSONObject>>(HttpStatus.BAD_REQUEST);
//        }
//    }


    @GetMapping(value = "prodetail",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<JSONObject> ProDetail(@RequestParam("statuss") int statuss){
        try {

            return new ResponseEntity<JSONObject>(productService.findProd(statuss),HttpStatus.OK);


        } catch (Exception e) {
            return new ResponseEntity<JSONObject>(HttpStatus.BAD_REQUEST);
        }
    }

        @GetMapping(value = "prodListseller",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<JSONObject>> WaitingList(@RequestParam("statuss") int statuss, @RequestParam("uidd") int uidd){
        try {
            if(statuss == 0){
            return new ResponseEntity<List<JSONObject>>(productService.listProductFilterStatusxx(ProductStatusEnum.NOT_APPROVE,uidd),HttpStatus.OK);
            } else if(statuss == 1){
                return new ResponseEntity<List<JSONObject>>(productService.listProductFilterStatusxx(ProductStatusEnum.APPROVED,uidd),HttpStatus.OK);
            } else{
                return new ResponseEntity<List<JSONObject>>(HttpStatus.BAD_REQUEST);
            }

        } catch (Exception e) {
            return new ResponseEntity<List<JSONObject>>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "loadpaid",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<JSONObject>> LoadPaid(@RequestParam("userID") int userID){
        try {

                return new ResponseEntity<List<JSONObject>>(productService.findPaidProd(userID),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<List<JSONObject>>(HttpStatus.BAD_REQUEST);
        }
    }


    //Sign in/ up, match user name
    @GetMapping(value = "matchuname")
    public ResponseEntity<Integer> MatchUname(@RequestParam("uname") String uname) {
        try {
            int hold = service.matchuname(uname);
            return new ResponseEntity<Integer>(hold,HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "signin",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<UserJ> Signin(@RequestParam("uname") String uname, @RequestParam("pass") String pass,HttpSession session) {
        try {
            return new ResponseEntity<UserJ>(uservice.signin(uname,pass),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<UserJ>(HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping(value = "createuser",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Integer> Signup(@RequestParam("uname") String uname,@RequestParam("pass") String pass) {
        try {
            User u = new User();
            u.setUserName(uname);
            u.setPassword(pass);
            return new ResponseEntity<Integer>(uservice.createUser1(u),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping(value = "updateacc",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Integer> Update(
            @RequestParam("accF") String accF,
            @RequestParam("accE") String accE,
            @RequestParam("accP") String accP, HttpSession session){
        try {
            User u = (User) session.getAttribute("acc");
            System.out.println(u.getId()+ " -- " + u.getUserName());
            User u2 = uservice.findID(u.getId());
            u2.setFullname(accF);
            u2.setEmail(accE);
            u2.setPhone(accP);

            return new ResponseEntity<Integer>(uservice.upUser(u2),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping(value = "changepass",produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Boolean> Update(
            @RequestParam("pass") String pass, HttpSession session){
        try {
            User u = (User) session.getAttribute("acc");
            User u2 = uservice.findID(u.getId());
            u2.setPassword(pass);
            return new ResponseEntity<Boolean>(uservice.changepass(u2),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(false,HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping(value = "banUser")
    public JSONObject banUser(@RequestParam("id") int id) {
            System.out.println(id);
            JSONObject noti = uservice.banUser(id);
            List<JSONObject> result = userService.listUserNotBan(UserStatusEnum.ACTIVE);
            noti.put("users",result);
            return noti;
    }

    @RequestMapping(value = {"changeprod"},method = RequestMethod.GET,produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
    public ResponseEntity<Integer> action(@RequestParam int action, @RequestParam int id){

        try {
            return new ResponseEntity<Integer>(productService.changeBidding(action, id),HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Integer>(HttpStatus.BAD_REQUEST);
        }
    }
    @GetMapping(value = "wallet")
    public JSONObject wallettransaction(@RequestParam("id") int id) {

        try {
            System.out.println(id);
            return uservice.getListHistoryById(id);
        } catch (Exception e) {
            return null;
        }
    }
}
