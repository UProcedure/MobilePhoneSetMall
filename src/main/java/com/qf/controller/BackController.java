package com.qf.controller;

import cn.hutool.core.convert.Convert;
import com.google.gson.Gson;
import com.qf.entity.*;
import com.qf.service.*;
import com.qf.utils.UpUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("back")
public class BackController {
    @Autowired
    private IBrandService brandService;
    @Autowired
    private IPhoneService phoneService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IFilmService filmService;

    @RequestMapping("login")
    public String login(User user, ModelMap map, boolean RememberMe, HttpSession session,ModelMap modelMap){
        Subject currentUser = SecurityUtils.getSubject();
        if(true){
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword());
            token.setRememberMe(RememberMe);
            try {
                currentUser.login(token);
            }catch (AuthenticationException e){
                e.printStackTrace();
                System.out.println("认证失败！");
                return  "login";
            }
        }
        user = (User) currentUser.getPrincipal();
        return "redirect:../backend/backIndex.jsp";
    }

    @RequestMapping("toBrandList")
    @RequiresPermissions("admin")
    public String toBrandList(ModelMap modelMap){
        List<Brand> allBrand = brandService.getAllBrand();
        modelMap.put("brandList",allBrand);
        return "backend/brand-list";
    }

    @RequestMapping("getPhoneByBrandId")
    @ResponseBody
    @RequiresPermissions("admin")
    public List<Phone> getPhoneByBrandId(int brandId){
        return phoneService.getPhoneByBrandId(brandId);
    }


    @RequestMapping("getGoodsByPhoneId")
    @RequiresPermissions("admin")
    public String getGoodsByPhoneId(Page<Goods> page,String phoneId,ModelMap modelMap){
        int id = 0;
        if(phoneId!=null){
            id = Integer.valueOf(phoneId);
        }
        System.out.println(id);
        page = goodsService.getGoodsByPhoneId(page,id);
        System.out.println(page);
        page.setUrl("back/getGoodsByPhoneId");
        modelMap.put("page",page);
        HashMap<String,Object> map = new HashMap<>();
        map.put("phoneId",phoneId);
        modelMap.put("conditions",new Gson().toJson(map));
        modelMap.put("phoneId",phoneId);
        return "backend/goods-list";
    }


    @RequestMapping("toBrandUpdateOne/{id}")
    @RequiresPermissions("admin")
    public String toBrandUpdateOne(ModelMap modelMap, @PathVariable String id){
        List<Brand> allBrand = brandService.getAllBrand();
        modelMap.put("brandList",allBrand);
        if("one".equals(id)){
            return "backend/PopUps/brand-update";
        }
        return "backend/PopUps/phone-update";
    }

    @RequestMapping("getBrandById")
    @RequiresPermissions("admin")
    public String getBrandById(int id,ModelMap modelMap){
        Brand brand = brandService.selectByPrimaryKey(id);
        modelMap.put("brand",brand);
        return "backend/PopUps/brand-update-more";
    }

    @RequestMapping("brandUpdate")
    @RequiresPermissions("admin")
    public String brandUpdate(@RequestParam("files") MultipartFile[] files, ModelMap modelMap, Brand brand, HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        brand.setPhoneimage(imagePath);
        int i = brandService.updateByPrimaryKeySelective(brand);
        modelMap.put("msg","修改成功！！");
        return "common/ok";
    }
    @RequestMapping("brandAdd")
    @RequiresPermissions("admin")
    public String brandAdd(@RequestParam("files") MultipartFile[] files, ModelMap modelMap,Brand brand,HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        brand.setPhoneimage(imagePath);
        int i = brandService.insertSelective(brand);
        modelMap.put("msg","添加成功！！");
        return "redirect:/back/toPhoneAdd";
    }

    @RequestMapping("getPhoneByPhoneId")
    @RequiresPermissions("admin")
    public String getPhoneByPhoneId(int id,ModelMap modelMap){
        modelMap.put("phone",phoneService.selectByPrimaryKey(id));
        return "backend/PopUps/phone-update-more";
    }


    @RequestMapping("phoneUpdate")
    @RequiresPermissions("admin")
    public String phoneUpdate(@RequestParam("files") MultipartFile[] files, ModelMap modelMap,Phone phone,HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        phone.setPhoneimage(imagePath);
        phoneService.updateByPrimaryKeySelective(phone);
        modelMap.put("msg","修改成功！！");
        return "common/ok";
    }

    @RequestMapping("phoneAdd")
    @RequiresPermissions("admin")
    public String phoneAdd(@RequestParam("files") MultipartFile[] files, ModelMap modelMap,Phone phone,HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        phone.setPhoneimage(imagePath);
        phoneService.insertSelective(phone);
        modelMap.put("msg","添加成功！！");
        return "common/ok";
    }

    @RequestMapping("toPhoneAdd")
    @RequiresPermissions("admin")
    public String toPhoneAdd(ModelMap modelMap){
        List<Brand> allBrand = brandService.getAllBrand();
        modelMap.put("brandList",allBrand);
        return "backend/PopUps/phone-add";
    }


    @RequestMapping("toUpdateByGoodsId/{id}")
    @RequiresPermissions("admin")
    public String toUpdateByGoodsId(@PathVariable int id,ModelMap modelMap){
        GoodsInfo goodsInfo = goodsService.getGoodsByGoodsId(id);
        if(goodsInfo.getPhone()!=null && goodsInfo.getPhone().getBrandId()!=null){
            List<Phone> phoneByBrandId = phoneService.getPhoneByBrandId(goodsInfo.getPhone().getBrandId());
            modelMap.put("phoneList",phoneByBrandId);
        }
        if(goodsInfo.getFilm()!=null && goodsInfo.getFilm().getProductId()!=null){
            List<Film> filmByProductId = filmService.getFilmByProductId(goodsInfo.getFilm().getProductId());
            modelMap.put("filmList",filmByProductId);
        }
        modelMap.put("goodsInfo",goodsInfo);
        modelMap.put("brandList",brandService.getAllBrand());
        modelMap.put("productList",productService.getAllProduct());
        return "backend/PopUps/goods-update";
    }


}
