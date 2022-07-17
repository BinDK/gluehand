package com.mvc.rest;

import com.mvc.helper.FileHelper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;

@RestController
@RequestMapping("adminapi")
public class AdminAjax implements ServletContextAware {
    private ServletContext servletContext;

    @Override
    public void setServletContext(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    @DeleteMapping(value = "upload")
    public ResponseEntity<Boolean> handleFileUpload(@RequestParam(value = "files",required = false) MultipartFile[] files ) {
        try {
            for(MultipartFile file : files) {
                System.out.println("file Name: " + file.getName());
                System.out.println("file Orginal Name: " + file.getOriginalFilename());
                System.out.println("file size: " + file.getSize());
                System.out.println("file type: " + file.getContentType());
                String fileName = FileHelper.upload(servletContext, file);
            }
            return new ResponseEntity<Boolean>(HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
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

}
