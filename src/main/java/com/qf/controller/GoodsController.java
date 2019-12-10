package com.qf.controller;

import cn.hutool.core.convert.Convert;
import com.google.gson.Gson;
import com.qf.domain.ShopDomain;
import com.qf.entity.*;
import com.qf.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author weimin
 * @ClassName GoodsController
 * @Description TODO
 * @date 2019/10/10 20:18
 */
@Controller
@RequestMapping("goods")
public class GoodsController {
    @Autowired
    private IBrandService brandService;
    @Autowired
    private IGoodsService goodsService;
    @Autowired
    private IReceivingAddressService receivingAddressService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IGoodsOrderService goodsOrderService;

    @RequestMapping("search/{rs}")
    public String search(Page<Goods> page,@PathVariable String rs , ModelMap modelMap){
        Page<Goods> goodsList = goodsService.getGoodsSearch(page,rs);
        goodsList.setUrl("goods/search/"+rs);
        modelMap.put("page",goodsList);
        List<Brand> list = brandService.getAllBrand();
        HashMap<String,Object> conditions = new HashMap<>();
        conditions.put("rs",rs);
        modelMap.put("conditions",new Gson().toJson(conditions));
        modelMap.put("rs",rs);
        modelMap.put("brandList",list);
        return "tourist/goodsShow";
    }
    @RequestMapping("buyGoods/{id}")
    public String buyGoods(@PathVariable int id,ModelMap modelMap){
        GoodsInfo goodsInfo = goodsService.getGoodsByGoodsId(id);
        modelMap.put("goodsInfo",goodsInfo);
        return "loginPage/goodsInfo";
    }

    @RequestMapping("addShopCat")
    @ResponseBody
    public boolean addShopCat(int id,int count,HttpSession session,HttpServletResponse response){
        Goods goods = goodsService.selectByPrimaryKey(id);
        System.out.println(goods);
        ShopDomain shopDomain = new ShopDomain(count, goods);
        ShopCart shopCart = getShopCart(session,response);
        boolean b = shopCart.addShopCart(shopDomain);
        return b;
    }

    @RequestMapping("delShopCat/{goodsId}")
    @ResponseBody
    public boolean delShopCat(ModelMap modelMap,@PathVariable String goodsId,HttpSession session,HttpServletResponse response){
        String substring = goodsId.substring(1);
        ShopCart shopCart = getShopCart(session,response);
        int a = shopCart.getList().size();
        int id = Convert.toInt(substring);
        shopCart.removeShopCart(id);
        System.out.println(shopCart);
        if((a-1)==shopCart.getList().size()){
            return true;
        }
        return false;
    }

    @RequestMapping("ChangeCount")
    @ResponseBody
    public String ChangeCount(int id,String name,String count,HttpSession session, HttpServletResponse response){
        int c = 0;
        if(count!=null){
            c = Integer.valueOf(count);
        }
        ShopCart shopCart = getShopCart(session,response);
        return shopCart.changeCount(id,name,c);
    }

    @RequestMapping("delGoodsById")
    @ResponseBody
    @RequiresPermissions("admin")
    public int delGoodsById(int goodsId){
        return goodsService.deleteByPrimaryKey(goodsId);
    }

    @RequestMapping("toBuySettlement")
    public String toBuySettlement(ModelMap map){
        Subject currentUser =  SecurityUtils.getSubject();
        User user = (User) currentUser.getPrincipal();
        int id = user.getId();
        System.out.println("用户id:"+id);
        List<ReceivingAddress> receivingAddress = receivingAddressService.getAddress(id);
        System.out.println(receivingAddress);
        map.put("receivingAddress",receivingAddress);
        return "loginPage/pay";
    }

    @RequestMapping("addAddress")
    public String addAddress(HttpSession session, ModelMap map, ReceivingAddress receivingAddress){
        Subject currentUser = SecurityUtils.getSubject();
        User user = (User) currentUser.getPrincipal();
        receivingAddress.setUserId(user.getId());
        System.out.println(user);
        receivingAddressService.insertSelective(receivingAddress);
        return "redirect: /goods/toBuySettlement";
    }

    @RequestMapping("deleteAddress/{id}")
    public String deleteAddress(@PathVariable int id,ReceivingAddress receivingAddress){
        Subject currentUser = SecurityUtils.getSubject();
        User user = (User) currentUser.getPrincipal();
        receivingAddress.setUserId(user.getId());
        System.out.println(id);
        receivingAddressService.deleteByPrimaryKey(id);
        return "redirect: /goods/toBuySettlement";
    }

    @RequestMapping("toUpdateAddress/{id}")
    public String toUpdate(@PathVariable int id,ModelMap map){
        ReceivingAddress receivingAddress = receivingAddressService.getAddressByAddressId(id);
        map.put("receivingAddress",receivingAddress);
        System.out.println(receivingAddress);
        return "loginPage/updateAddress";
    }

    @RequestMapping("updateAddress")
    public String update(ReceivingAddress receivingAddress){
        receivingAddressService.updateByPrimaryKey(receivingAddress);
        return "redirect: /goods/toBuySettlement";
    }

    @RequestMapping("success")
    public String success( ModelMap map,Order order,
                           ReceivingAddress receivingAddress,
                           int receivingAddressId,HttpSession session){
        order.setDate(new Date());
        order.setAddressId(receivingAddressId);
        int userId = ((User)SecurityUtils.getSubject().getPrincipal()).getId();
        order.setUserId(userId);
        int i = orderService.insertSelective(order);
        ShopCart shopCart = (ShopCart) session.getAttribute("shopCart");
        map.put("price",shopCart.getPirce());
        List<GoodsOrder> goodsOrderList = new ArrayList<>();
        List<GoodsCount> goodsCountList = new ArrayList<>();
        for (ShopDomain shopDomain : shopCart.getList()) {
            GoodsOrder goodsOrder = new GoodsOrder();
            goodsOrder.setUserId(userId);
            goodsOrder.setOrderId(order.getId());
            goodsOrder.setGoodsId(shopDomain.getGoods().getId());
            goodsOrder.setGoodsCount(shopDomain.getCount());
            goodsOrderList.add(goodsOrder);
            goodsCountList.add(new GoodsCount(shopDomain.getGoods().getId(),shopDomain.getCount()));
        }
        int x = goodsOrderService.insertBatch(goodsOrderList);
        System.out.println("添加goodsOrder数量"+x);
        if(x>0 && shopCart!=null){
            session.removeAttribute("shopCart");
            goodsService.batchUpdateCount(goodsCountList);
            map.put("receivingAddress",receivingAddress);
            map.put("order",order);
            return "loginPage/success";
        }
        map.put("msg","发生未知错误支付失败");
        return "common/ok";
    }

    @RequestMapping("successOne")
    public String successOne( ModelMap map,Order order,ReceivingAddress receivingAddress,String OnePrice,int receivingAddressId,Integer goodsId,Integer count){
        order.setDate(new Date());
        order.setAddressId(receivingAddressId);
        int userId = ((User)SecurityUtils.getSubject().getPrincipal()).getId();
        order.setUserId(userId);
        int i = orderService.insertSelective(order);
        GoodsOrder goodsOrder = new GoodsOrder();
        goodsOrder.setUserId(userId);
        goodsOrder.setOrderId(order.getId());
        goodsOrder.setGoodsId(goodsId);
        goodsOrder.setGoodsCount(count);
        int x = goodsOrderService.insertSelective(goodsOrder);
        map.put("receivingAddress",receivingAddress);
        map.put("order",order);
        map.put("OnePrice",OnePrice);
        if(x>0){
            goodsService.updateGoodsCount(goodsId,count);
            return "loginPage/successOne";
        }
        map.put("msg","发生未知错误支付失败");
        return "common/ok";
    }


    @RequestMapping("buyGoodsOne/{goodsId}/{count}")
    public String buyGoodsOne(@PathVariable int goodsId, @PathVariable int count,ModelMap modelMap){
        Subject currentUser =  SecurityUtils.getSubject();
        User user = (User) currentUser.getPrincipal();
        int id = user.getId();
        List<ReceivingAddress> receivingAddress = receivingAddressService.getAddress(id);
        modelMap.put("receivingAddress",receivingAddress);
        modelMap.put("domain",new ShopDomain(count, goodsService.selectByPrimaryKey(goodsId)));
        return "loginPage/payOne";
    }

    @RequestMapping("toAddAddressOne/{goodsId}/{count}")
    public String toAddAddressOne(@PathVariable int goodsId, @PathVariable int count,ModelMap modelMap){
        modelMap.put("goodsId",goodsId);
        modelMap.put("count",count);
        return "loginPage/addAddressOne";
    }

    @RequestMapping("addAddressOne/{goodsId}/{count}")
    public String addAddressOne(@PathVariable int goodsId, @PathVariable int count,HttpSession session, ModelMap map, ReceivingAddress receivingAddress){
        Subject currentUser = SecurityUtils.getSubject();
        User user = (User) currentUser.getPrincipal();
        receivingAddress.setUserId(user.getId());
        receivingAddressService.insertSelective(receivingAddress);
        return "redirect:/goods/buyGoodsOne/"+goodsId+ File.separator +count;
    }

    @RequestMapping("backSearch")
    public String backSearch(Page<Goods> page, ModelMap modelMap){
        Page<Goods> goodsList = goodsService.getGoodsSearch(page,null);
        goodsList.setUrl("goods/backSearch");
        modelMap.put("page",goodsList);
        List<Brand> list = brandService.getAllBrand();
        modelMap.put("brandList",list);
        return "backend/admin-goods";
    }

    @RequestMapping("selectByCondition")
    @RequiresPermissions("admin")
    public String selectByCondition(Page<Goods> page,String rs,ModelMap modelMap){
        page = goodsService.getGoodsSearch(page,rs);
        page.setUrl("goods/selectByCondition");
        modelMap.put("page",page);
        modelMap.put("rs",rs);
        HashMap<String,String> map = new HashMap<>();
        map.put("rs",rs);
        modelMap.put("conditions",new Gson().toJson(map));
        return "backend/admin-goods";
    }

    @RequestMapping("batchDel")
    @RequiresPermissions("admin")
    @ResponseBody
    public int batchDel(@RequestParam List<Integer> ids){
        return goodsService.deleteBatch(ids);
    }


    private ShopCart getShopCart(HttpSession session, HttpServletResponse response) {
        ShopCart shopCart = (ShopCart) session.getAttribute("shopCart");
        System.out.println(shopCart);
        if(shopCart==null){
            shopCart = new ShopCart();
            session.setAttribute("shopCart", shopCart);
        }
        Cookie cookie = new Cookie("JSESSIONID", session.getId());
        cookie.setMaxAge(60*60*24);
        session.setMaxInactiveInterval(60*60*24);
        response.addCookie(cookie);
        return shopCart;
    }

    @RequestMapping("goodsOrderList/{id}")
    @RequiresPermissions("admin")
    public String goodsOrderList(@PathVariable Integer id, ModelMap modelMap){
        List<GoodsOrderAll> goodsOrderAll = goodsOrderService.getGoodsOrderList(id);

        modelMap.put("all",goodsOrderAll);
        return "backend/PopUps/goodsOrderList";
    }

}
