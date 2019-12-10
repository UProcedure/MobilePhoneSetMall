package com.qf.controller;

import com.qf.entity.*;
import com.qf.service.IBrandService;
import com.qf.service.IFilmService;
import com.qf.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author qq166
 */
@Controller
@RequestMapping("product")
public class ProductController {

    @Autowired
    private IBrandService brandService;
    @Autowired
    private IProductService productService;
    @Autowired
    private IFilmService filmService;

    @RequestMapping("getByFilmId/{id}")
    public String getByPhoneId(@PathVariable int id){
        Film film = filmService.selectByPrimaryKey(id);
        return "forward:/goods/search/"+film.getName();
    }


    @RequestMapping("toProduct/{id}")
    public String toProduct(ModelMap modelMap, @PathVariable String id){
        int productsId = 12;
        List<Brand> list = brandService.getAllBrand();
        modelMap.put("brandList",list);
        List<Product> products = productService.getAllProduct();
        modelMap.put("productList",products);
        if(id!=null){
            productsId = Integer.valueOf(id);
        }
        Product product = productService.selectByPrimaryKey(productsId);
        modelMap.put("product",product);
        Page<Film> page = new Page<>();
        page.setPageSize(1);
        page.setPageSize(4);
        Page<Film> filmList = filmService.getFilmByProductIdPage(page,productsId);
        modelMap.put("filmList",filmList);
        return "tourist/product_list";
    }

    @RequestMapping("getFilmByProductId/{id}")
    @ResponseBody
    public List<Film> getPhoneListByBrandId(@PathVariable Integer id, ModelMap modelMap){
        List<Film> filmList = filmService.getFilmByProductId(id);
        return filmList;
    }


}
