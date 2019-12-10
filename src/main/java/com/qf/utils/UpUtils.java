package com.qf.utils;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * @author weimin
 * @ClassName UpUtils
 * @Description TODO
 * @date 2019/10/13 16:20
 */
public class UpUtils {
    public static String getStringUpdate(@RequestParam("files") MultipartFile[] files, HttpServletRequest request) throws IOException {
        String imagePath = null;
        for (MultipartFile file : files) {
            if(file.getSize()!=0){
                imagePath = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
                String path = "F:\\ideaWoke\\MobilePhoneSetMall\\src\\main\\webapp\\images\\brand";
                path = path+ File.separator+imagePath;
                /*String path = request.getSession().getServletContext().getRealPath("");
                path = path+imagePath;*/
                FileCopyUtils.copy(file.getInputStream(),new FileOutputStream(path));
                imagePath = "images/brand/"+imagePath;
            }
        }
        return imagePath;
    }
}
