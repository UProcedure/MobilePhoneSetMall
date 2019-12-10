package com.qf.service;

import com.qf.entity.Film;
import com.qf.entity.Page;

import java.util.List;

/**
 * @author qq166
 */
public interface IFilmService extends IBaseService<Film> {
    List<Film> getFilmByProductId(int productsId);

    Film getFilmByFilmNameProductId(String filmName, int productId);

    boolean deleteByFilmId(Integer filmId);

    Page<Film> getFilmByProductIdPage(Page<Film> page, int productsId);
}
