package com.qf.entity;

/**
 * @author weimin
 * @ClassName GoodsCount
 * @Description TODO
 * @date 2019/10/14 21:01
 */
public class GoodsCount {
    private Integer goodsId;
    private Integer count;


    public GoodsCount(Integer goodsId, Integer count) {
        this.goodsId = goodsId;
        this.count = count;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
