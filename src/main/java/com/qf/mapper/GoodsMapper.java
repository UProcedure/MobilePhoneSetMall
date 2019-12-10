package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.Film;
import com.qf.entity.Goods;
import com.qf.entity.GoodsCount;
import com.qf.entity.Phone;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface GoodsMapper extends IBaseDao<Goods> {

    List<Goods> getGoodsSearch(String rs);

    List<Goods> getGoodsByPhoneId(int id);

    List<Goods> getGoodsByFilmId(int id);

    int deleteBatch(@Param("ids") List<Integer> ids);

    int updateGoodsCount(@Param("goodsId") Integer goodsId, @Param("count") Integer count);

    int batchUpdateCount(List<GoodsCount> goodsCountList);

    int deleteByFilmId(@Param("filmByProductId") int filmByProductId);

    int deleteByFilmIdOne(Integer filmId);

    int deletePhoneIdBatch(@Param("phones") int phones);

    int deletePhoneId(Integer phoneId);

    Goods getGoodsByPhoneFilm(@Param("phoneId") Integer phoneId, @Param("filmId") Integer filmId, @Param("goodsName") String goodsName);

    Goods getGoodsByGoodsId(Integer goodsId);
}