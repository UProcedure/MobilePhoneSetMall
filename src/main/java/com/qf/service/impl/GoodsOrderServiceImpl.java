package com.qf.service.impl;

import com.qf.dao.IBaseDao;
import com.qf.entity.Goods;
import com.qf.entity.GoodsOrder;
import com.qf.entity.GoodsOrderAll;
import com.qf.mapper.GoodsMapper;
import com.qf.mapper.GoodsOrderMapper;
import com.qf.service.IGoodsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author weimin
 * @ClassName GoodsOrderServiceImpl
 * @Description TODO
 * @date 2019/10/12 11:31
 */
@Service
public class GoodsOrderServiceImpl extends BaseServiceImpl<GoodsOrder> implements IGoodsOrderService {

    @Autowired
    private GoodsOrderMapper goodsOrderMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public IBaseDao<GoodsOrder> getDao() {
        return goodsOrderMapper;
    }

    @Override
    public int insertBatch(List<GoodsOrder> goodsOrderList) {
        return goodsOrderMapper.insertBatch(goodsOrderList);
    }

    @Override
    public List<GoodsOrderAll> getGoodsOrderList(Integer id) {
        List<GoodsOrder> goodsOrderList = goodsOrderMapper.getGoodsOrderList(id);
        List<GoodsOrderAll> list = new ArrayList<>(goodsOrderList.size());
        for (GoodsOrder goodsOrder : goodsOrderList) {
            GoodsOrderAll goodsOrderAll = new GoodsOrderAll();
            Goods goods = goodsMapper.getGoodsByGoodsId(goodsOrder.getGoodsId());
            goodsOrderAll.setGoods(goods);
            goodsOrderAll.setCount(goodsOrder.getGoodsCount());
            list.add(goodsOrderAll);
        }
        return list;
    }
}
