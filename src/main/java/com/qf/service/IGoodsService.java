package com.qf.service;

import com.qf.entity.Goods;
import com.qf.entity.GoodsCount;
import com.qf.entity.GoodsInfo;
import com.qf.entity.Page;

import java.util.HashMap;
import java.util.List;

/**
 * @author qq166
 */
public interface IGoodsService extends IBaseService<Goods> {
    Page<Goods> getGoodsSearch(Page<Goods> page,String rs);

    GoodsInfo getGoodsByGoodsId(int id);


    Page<Goods> getGoodsByPhoneId(Page<Goods> page,int id);

    Page<Goods> getGoodsByFilmId(Page<Goods> page,int id);

    int deleteBatch(List<Integer> ids);

    void updateGoodsCount(Integer goodsId, Integer count);

    void batchUpdateCount(List<GoodsCount> goodsCountList);

    Goods getGoodsByPhoneFilm(Integer phoneId, Integer filmId, String goodsName);
}
