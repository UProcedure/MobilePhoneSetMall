package com.qf.service.impl;

import com.github.pagehelper.PageHelper;
import com.qf.dao.IBaseDao;
import com.qf.entity.Order;
import com.qf.entity.Page;
import com.qf.entity.User;
import com.qf.mapper.OrderMapper;
import com.qf.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author weimin
 * @ClassName OrderServiceImpl
 * @Description TODO
 * @date 2019/10/12 11:27
 */
@Service
public class OrderServiceImpl extends BaseServiceImpl<Order> implements IOrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public IBaseDao<Order> getDao() {
        return orderMapper;
    }

    @Override
    public Page<Order> getAllOrder(Page<Order> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Order> allOrder =orderMapper.getAllOrder();
        return new Page<>(allOrder);
    }

    @Override
    public Page<Order> getOrderByusernameList(Page<Order> page, String byUserName) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Order> list = orderMapper.getOrderByusernameList(byUserName);
        return new Page<>(list);
    }

    @Override
    public int deleteBatch(List<Integer> ids) {
        return orderMapper.deleteBatch(ids);
    }
}
