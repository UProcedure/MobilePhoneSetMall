package com.qf.controller;
import	java.lang.ref.Reference;

import com.qf.entity.Brand;
import com.qf.entity.Page;
import com.qf.entity.Phone;
import com.qf.service.IBrandService;
import com.qf.service.IPhoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author weimin
 * @ClassName BrandController
 * @Description TODO
 * @date 2019/10/10 12:55
 */
@Controller
@RequestMapping("brand")
public class BrandController {
    @Autowired
    private IBrandService brandService;
    @Autowired
    private IPhoneService phoneService;

    @RequestMapping("getByPhoneId/{id}")
    public String getByPhoneId(@PathVariable int id){
        Phone phone = phoneService.selectByPrimaryKey(id);
        return "forward:/goods/search/"+phone.getPhonename();
    }

    @RequestMapping("brandIndex")
    public String brandIndex(ModelMap modelMap){
        List<Brand> list = brandService.getAllBrand();
        modelMap.put("brandList",list);
        return "tourist/index";
    }

    @RequestMapping("brandList/{id}")
    public String brandList(@PathVariable String id,ModelMap modelMap){
        int brandId = 10;
        if(id!=null){
            brandId = Integer.valueOf(id);
        }
        List<Brand> brandList = brandService.getAllBrand();
        Page<Phone> objectPage = new Page<>();
        objectPage.setCurrentPage(1);
        objectPage.setPageSize(4);
        Page<Phone> phoneList = phoneService.getPhoneByBrandIdPage(objectPage,brandId);
        Brand brand = brandService.selectByPrimaryKey(brandId);
        modelMap.put("brandList",brandList);
        modelMap.put("phoneList",phoneList);
        modelMap.put("brand",brand);
        return "tourist/brand";
    }


    @RequestMapping("getPhoneListByBrandId/{id}")
    @ResponseBody
    public List<Phone> getPhoneListByBrandId(@PathVariable Integer id,ModelMap modelMap){
        List<Phone> phoneList = phoneService.getPhoneByBrandId(id);
        return phoneList;
    }


}
