package com.qf.service.impl;

import com.qf.dao.IBaseDao;
import com.qf.entity.Film;
import com.qf.entity.Product;
import com.qf.mapper.FilmMapper;
import com.qf.mapper.GoodsMapper;
import com.qf.mapper.ProductMapper;
import com.qf.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author weimin
 * @ClassName ProductServiceImpl
 * @Description TODO
 * @date 2019/10/10 16:07
 */
@Service
public class ProductServiceImpl extends BaseServiceImpl<Product> implements IProductService {

    @Autowired
    private ProductMapper productMapper;
    @Autowired
    private FilmMapper filmMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public IBaseDao<Product> getDao() {
        return productMapper;
    }

    @Override
    public List<Product> getAllProduct() {
        return productMapper.getAllProduct();
    }

    @Override
    public Product getProductByProductName(String productName) {
        return productMapper.getProductByProductName(productName);
    }

    @Override
    public boolean deleteByProductId(Integer productId) {
        System.out.println("productId="+productId);
        int y = goodsMapper.deleteByFilmId(productId);
        int x = filmMapper.deleteByProductId(productId);
        int i = productMapper.deleteByPrimaryKey(productId);
        return i>0;
    }
}
