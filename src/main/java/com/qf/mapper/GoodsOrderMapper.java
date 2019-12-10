package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.GoodsOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author qq166
 */
public interface GoodsOrderMapper extends IBaseDao<GoodsOrder> {

    int insertBatch(@Param("goodsOrderList") List<GoodsOrder> goodsOrderList);

    List<GoodsOrder> getGoodsOrderList(Integer id);
}