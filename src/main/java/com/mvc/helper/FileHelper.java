package com.mvc.helper;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class FileHelper {
    public static String upload(ServletContext servletContext, MultipartFile file){
        try {
            String name = UUID.randomUUID().toString().replace("-","");
            int lastIndex = file.getOriginalFilename().lastIndexOf(".");
            String ext = file.getOriginalFilename().substring(lastIndex);
            String fileName = name + ext;

            byte[] bytes = file.getBytes();
            Path path = Paths.get(servletContext.getRealPath("/uploads/images/" + fileName));
            Files.write(path,bytes);
            return fileName;
        } catch (Exception e){
            System.out.println(e.getMessage());

            return null;
        }
    }
}
