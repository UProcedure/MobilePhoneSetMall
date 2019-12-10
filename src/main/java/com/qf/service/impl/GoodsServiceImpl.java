package com.qf.service.impl;

import com.github.pagehelper.PageHelper;
import com.qf.dao.IBaseDao;
import com.qf.entity.*;
import com.qf.mapper.FilmMapper;
import com.qf.mapper.GoodsMapper;
import com.qf.mapper.PhoneMapper;
import com.qf.service.IGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;

/**
 * @author weimin
 * @ClassName GoodsServiceImpl
 * @Description TODO
 * @date 2019/10/10 20:07
 */
@Service
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements IGoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Autowired
    private FilmMapper filmMapper;
    @Autowired
    private PhoneMapper phoneMapper;

    @Override
    public IBaseDao<Goods> getDao() {
        return goodsMapper;
    }

    @Override
    public Page<Goods> getGoodsSearch(Page<Goods> page,String rs) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> goodsList = goodsMapper.getGoodsSearch(rs);
        return getGoodsPage(goodsList);
    }


    @Override
    public GoodsInfo getGoodsByGoodsId(int id) {
        Goods goods = goodsMapper.selectByPrimaryKey(id);
        Phone phone = new Phone();
        if(goods.getPhoneId()!=null){
            phone = phoneMapper.selectByPrimaryKey(goods.getPhoneId());
        }
        Film film = new Film();
        if(goods.getFilmId()!=null){
            film = filmMapper.selectByPrimaryKey(goods.getFilmId());
        }
        return new GoodsInfo(goods,film,phone);
    }

    @Override
    public Page<Goods> getGoodsByPhoneId(Page<Goods> page,int id) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> goodsList = goodsMapper.getGoodsByPhoneId(id);
        return getGoodsPage(goodsList);
    }

    @Override
    public Page<Goods> getGoodsByFilmId(Page<Goods> page,int id) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Goods> goodsList = goodsMapper.getGoodsByFilmId(id);
        return getGoodsPage(goodsList);
    }

    @Override
    public int deleteBatch(List<Integer> ids) {
        return goodsMapper.deleteBatch(ids);
    }

    @Override
    public void updateGoodsCount(Integer goodsId, Integer count) {
        goodsMapper.updateGoodsCount(goodsId,count);
    }

    @Override
    public void batchUpdateCount(List<GoodsCount> goodsCountList) {
        goodsMapper.batchUpdateCount(goodsCountList);
    }

    @Override
    public Goods getGoodsByPhoneFilm(Integer phoneId, Integer filmId, String goodsName) {
        return goodsMapper.getGoodsByPhoneFilm(phoneId,filmId,goodsName);
    }

    private Page<Goods> getGoodsPage(List<Goods> goodsList) {
        return new Page<>(goodsList);
    }
}
