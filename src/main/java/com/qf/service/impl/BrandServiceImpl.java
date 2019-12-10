package com.qf.service.impl;

import com.qf.dao.IBaseDao;
import com.qf.entity.Brand;
import com.qf.entity.Phone;
import com.qf.mapper.BrandMapper;
import com.qf.mapper.GoodsMapper;
import com.qf.mapper.PhoneMapper;
import com.qf.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author weimin
 * @ClassName BrandServiceImpl
 * @Description TODO
 * @date 2019/10/10 12:59
 */
@Service
public class BrandServiceImpl extends BaseServiceImpl<Brand> implements IBrandService  {
    @Autowired
    private BrandMapper brandMapper;
    @Autowired
    private PhoneMapper phoneMapper;
    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public IBaseDao<Brand> getDao() {
        return brandMapper;
    }

    @Override
    public List<Brand> getAllBrand() {
        return brandMapper.getAllBrand();
    }

    @Override
    public Brand getBrandByBrandName(String brandName) {
        return brandMapper.getBrandByBrandName(brandName);
    }

    @Override
    public boolean deleteByBrandId(Integer brandId) {
        int b = phoneMapper.deleteByBrandId(brandId);
        int i = brandMapper.deleteByPrimaryKey(brandId);
        int y = goodsMapper.deletePhoneIdBatch(brandId);
        return b>0||i>0||y>0;
    }
}
