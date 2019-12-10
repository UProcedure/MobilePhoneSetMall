package com.qf.service.impl;

import com.github.pagehelper.PageHelper;
import com.qf.dao.IBaseDao;
import com.qf.entity.Film;
import com.qf.entity.Page;
import com.qf.mapper.FilmMapper;
import com.qf.mapper.GoodsMapper;
import com.qf.service.IFilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author weimin
 * @ClassName FilmServiceImpl
 * @Description TODO
 * @date 2019/10/10 16:17
 */
@Service
public class FilmServiceImpl extends BaseServiceImpl<Film> implements IFilmService {

    @Autowired
    private FilmMapper filmMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public IBaseDao<Film> getDao() {
        return filmMapper;
    }


    @Override
    public List<Film> getFilmByProductId(int productsId) {
        return filmMapper.getFilmByProductId(productsId);
    }

    @Override
    public Film getFilmByFilmNameProductId(String filmName, int productId) {
        return filmMapper.getFilmByFilmNameProductId(filmName,productId);
    }

    @Override
    public boolean deleteByFilmId(Integer filmId) {
        int a = filmMapper.deleteByPrimaryKey(filmId);
        int b = goodsMapper.deleteByFilmIdOne(filmId);
        return a>0&&b>0;
    }

    @Override
    public Page<Film> getFilmByProductIdPage(Page<Film> page, int productsId) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<Film> filmByProduct = filmMapper.getFilmByProductId(productsId);
        return new Page<Film>(filmByProduct);
    }
}
