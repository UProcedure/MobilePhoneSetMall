package com.qf.service;

import com.qf.entity.Order;
import com.qf.entity.Page;
import com.qf.entity.User;

import java.util.List;

/**
 * @author qq166
 */
public interface IOrderService extends IBaseService<Order> {

    Page<Order> getAllOrder(Page<Order> page);

    Page<Order> getOrderByusernameList(Page<Order> page, String byUserName);

    int deleteBatch(List<Integer> ids);
}
