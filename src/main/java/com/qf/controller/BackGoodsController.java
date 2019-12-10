package com.qf.controller;

import com.google.gson.Gson;
import com.qf.entity.*;
import com.qf.service.*;
import com.qf.utils.UpUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * @author weimin
 * @ClassName BackGoodsController
 * @Description TODO
 * @date 2019/10/13 15:37
 */
@Controller
@RequestMapping("backGoods")
public class BackGoodsController{
    @Autowired
    private IBrandService brandService;
    @Autowired
    private IPhoneService phoneService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IFilmService filmService;

    @RequestMapping("toProductList")
    @RequiresPermissions("admin")
    public String toProductList(ModelMap modelMap){
        List<Product> allProduct = productService.getAllProduct();
        modelMap.put("productList",allProduct);
        return "backend/product-list";
    }

    @RequestMapping("getFilmByProductList")
    @RequiresPermissions("admin")
    @ResponseBody
    public List<Film> getFilmByProductList(int id){
        return filmService.getFilmByProductId(id);
    }

    @RequestMapping("getGoodsByProductId")
    @RequiresPermissions("admin")
    public String getGoodsByProductId(Page<Goods> page,ModelMap modelMap,String filmId){
        System.out.println(filmId);
        int pid = 0;
        if(filmId!=null){
            pid = Integer.valueOf(filmId);
        }
        page = goodsService.getGoodsByFilmId(page,pid);
        page.setUrl("backGoods/getGoodsByProductId");
        modelMap.put("page",page);
        HashMap<String,Object> map = new HashMap<>();
        map.put("filmId",filmId);
        modelMap.put("conditions",new Gson().toJson(map));
        modelMap.put("filmId",filmId);
        return "backend/goods-list";
    }

    @RequestMapping("isBrand")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean isBrand(String brandName){
        Brand brand = brandService.getBrandByBrandName(brandName);
        if(brand==null){
            return true;
        }
        return false;
    }

    @RequestMapping("isPhone")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean isPhone(String phoneName,int brandId){
        Phone phone = phoneService.getPhoneByPhoneNameBrandId(phoneName,brandId);
        System.out.println("phone=="+phone);
        if(phone==null){
            return true;
        }
        return false;
    }
    @RequestMapping("isGoods")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean isGoods(Integer phoneId,Integer filmId,String goodsName){
        Goods goods = goodsService.getGoodsByPhoneFilm(phoneId,filmId,goodsName);
        System.out.println(phoneId+"="+filmId+"="+goodsName);
        if(goods==null){
            return true;
        }
        return false;
    }

    @RequestMapping("goodsUpdate")
    @RequiresPermissions("admin")
    public String goodsUpdate(@RequestParam("files") MultipartFile[] files, ModelMap modelMap, Goods goods, HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        goods.setImagesPath(imagePath);
        int i = goodsService.updateByPrimaryKeySelective(goods);
        System.out.println("商品修改回复：");
        modelMap.put("msg","修改成功！！");
        return "common/ok";
    }

    @RequestMapping("addGoods")
    @RequiresPermissions("admin")
    public String addGoods(@RequestParam("files") MultipartFile[] files, ModelMap modelMap, Goods goods, HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        goods.setImagesPath(imagePath);
        int i = goodsService.insertSelective(goods);
        if(i>0){
            modelMap.put("msg","添加成功！！");
        }else {
            modelMap.put("msg","添加失败!!!");
        }
        return "common/ok";
    }

    @RequestMapping("toGoodsAdd")
    @RequiresPermissions("admin")
    public String toGoodsAdd(ModelMap modelMap){
        modelMap.put("brandList",brandService.getAllBrand());
        modelMap.put("productList",productService.getAllProduct());
        return "backend/PopUps/goods-add";
    }
}
