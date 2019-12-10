package com.qf.service;

import com.qf.entity.GoodsOrder;
import com.qf.entity.GoodsOrderAll;

import java.util.List;

/**
 * @author qq166
 */
public interface IGoodsOrderService extends IBaseService<GoodsOrder>{
    int insertBatch(List<GoodsOrder> goodsOrderList);

    List<GoodsOrderAll> getGoodsOrderList(Integer id);
}
