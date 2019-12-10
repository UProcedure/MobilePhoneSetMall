package com.qf.entity;

/**
 * @author weimin
 * @ClassName GoodsOrderAll
 * @Description TODO
 * @date 2019/10/18 12:46
 */
public class GoodsOrderAll {
    private Goods goods;
    private Order order;
    private GoodsOrder goodsOrder;
    private Integer count;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public GoodsOrderAll() {
    }

    public GoodsOrderAll(Goods goods, Order order, GoodsOrder goodsOrder) {
        this.goods = goods;
        this.order = order;
        this.goodsOrder = goodsOrder;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public GoodsOrder getGoodsOrder() {
        return goodsOrder;
    }

    public void setGoodsOrder(GoodsOrder goodsOrder) {
        this.goodsOrder = goodsOrder;
    }
}
