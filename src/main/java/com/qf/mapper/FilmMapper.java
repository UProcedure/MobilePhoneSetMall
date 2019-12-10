package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.Film;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FilmMapper extends IBaseDao<Film> {

    List<Film> getFilmByProductId(int productsId);

    Film getFilmByFilmNameProductId(@Param("filmName") String filmName, @Param("productId") int productId);

    int deleteByProductId(Integer productId);

    int getCountByProductId(Integer productId);
}