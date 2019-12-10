package com.qf.controller;

import com.google.gson.Gson;
import com.qf.entity.Order;
import com.qf.entity.Page;
import com.qf.entity.User;
import com.qf.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {

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
    @Autowired
    private IOrderService orderService;


    @RequestMapping("orderBack")
    public String orderBack(Page<Order> page, ModelMap map){
        page = orderService.getAllOrder(page);
        page.setUrl("order/orderBack");
        map.put("page",page);
        return "backend/PopUps/order-back";
    }

    @RequestMapping("selectByCondition")
    public String selectByCondition(Page<Order> page, String byUserName, ModelMap modelMap){
        page = orderService.getOrderByusernameList(page,byUserName);
        page.setUrl("order/selectByCondition");
        modelMap.put("page",page);
        modelMap.put("rs",byUserName);
        HashMap<String,String> map = new HashMap<>();
        map.put("byUserName",byUserName);
        modelMap.put("conditions",new Gson().toJson(map));
        return "backend/PopUps/order-back";
    }

    @RequestMapping("batchDel")
    @RequiresPermissions("admin")
    @ResponseBody
    public int batchDel(@RequestParam List<Integer> ids){
        return orderService.deleteBatch(ids);
    }

}
