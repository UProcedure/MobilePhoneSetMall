package com.qf.controller;
import	java.lang.ref.Reference;
import	java.lang.annotation.Retention;

import com.qf.entity.Brand;
import com.qf.entity.Film;
import com.qf.entity.Phone;
import com.qf.entity.Product;
import com.qf.service.*;
import com.qf.utils.UpUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("productBack")
public class BackProductController {
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


    @RequestMapping("toProductUpdateOne/{id}")
    @RequiresPermissions("admin")
    public String toProductUpdateOne(ModelMap modelMap, @PathVariable String id){
        List<Product> allProduct = productService.getAllProduct();
        modelMap.put("productList",allProduct);
        if("one".equals(id)){
            return "backend/PopUps/product-update";
        }
        return "backend/PopUps/product-series-update";
    }


    @RequestMapping("getProductById")
    @RequiresPermissions("admin")
    public String getProductById(int id,ModelMap modelMap){
        Product product = productService.selectByPrimaryKey(id);
        modelMap.put("product",product);
        return "backend/PopUps/product-update-more";
    }

    @RequestMapping("productAdd")
    @RequiresPermissions("admin")
    public String productAdd( ModelMap modelMap, Product product) {
        int i = productService.insertSelective(product);
        return "redirect:/productBack/toProductAdd";
    }

    @RequestMapping("toProductAdd")
    @RequiresPermissions("admin")
    public String toProductAdd(ModelMap modelMap){
        List<Product> allProduct = productService.getAllProduct();
        modelMap.put("productList",allProduct);
        return "backend/PopUps/product-series-add";
    }

    @RequestMapping("productSeriesAdd")
    @RequiresPermissions("admin")
    public String productSeriesAdd(@RequestParam("filmimage") MultipartFile[] filmimage, ModelMap modelMap, Film film, HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(filmimage,request);
        film.setFilmimage(imagePath);
        filmService.insertSelective(film);
        modelMap.put("msg","添加成功！！");
        return "common/ok";
    }

    @RequestMapping("productUpdate")
    @RequiresPermissions("admin")
    public String productUpdate(ModelMap modelMap,Product product){
        int i = productService.updateByPrimaryKeySelective(product);
        modelMap.put("msg","修改成功");
        return "common/ok";
    }

    @RequestMapping("getFilmByFilmId")
    @RequiresPermissions("admin")
    public String getFilmByFilmId(ModelMap modelMap,Integer id){
        modelMap.put("film", filmService.selectByPrimaryKey(id));
        return "backend/PopUps/film-update-more";
    }

    @RequestMapping("getFilmByProductId")
    @RequiresPermissions("admin")
    @ResponseBody
    public List<Film> getFilmByProductId(Integer productId){
        return filmService.getFilmByProductId(productId);
    }

    @RequestMapping("filmUpdate")
    @RequiresPermissions("admin")
    public String filmUpdate(@RequestParam("files") MultipartFile[] files, ModelMap modelMap,Film film,HttpServletRequest request) throws IOException {
        String imagePath = UpUtils.getStringUpdate(files,request);
        film.setFilmimage(imagePath);
        int i = filmService.updateByPrimaryKeySelective(film);
        if(i>0){
            modelMap.put("msg","修改成功！！");
        }else {
            modelMap.put("msg","修改失败");
        }
        return "common/ok";
    }

    @RequestMapping("isProduct")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean isProduct(String productName){
        Product product = productService.getProductByProductName(productName);
        if(product==null){
            return true;
        }
        return false;
    }
    @RequestMapping("isFilm")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean isFilm(String filmName,int productId){
        Film film = filmService.getFilmByFilmNameProductId(filmName,productId);
        if(film==null){
            return true;
        }
        return false;
    }

    @RequestMapping("deleteProduct")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean deleteProduct(ModelMap map,Integer productId){
        return productService.deleteByProductId(productId);
    }

    @RequestMapping("deleteFilm")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean deleteFilm(ModelMap map,Integer filmId){
        return filmService.deleteByFilmId(filmId);
    }

    @RequestMapping("deleteBrand")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean deleteBrand(ModelMap map,Integer brandId){
        return brandService.deleteByBrandId(brandId);
    }

    @RequestMapping("deletePhone")
    @RequiresPermissions("admin")
    @ResponseBody
    public boolean deletePhone(ModelMap map,Integer phoneId){
        return phoneService.deleteByPhoneId(phoneId);
    }



}
