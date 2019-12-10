package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.Order;
import com.qf.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author qq166
 */
public interface OrderMapper extends IBaseDao<Order> {

    List<Order> getAllOrder();

    List<Order> getOrderByusernameList(String byUserName);

    int deleteBatch(@Param("ids")List<Integer> ids);

    int deleteByUserId(int userId);
}