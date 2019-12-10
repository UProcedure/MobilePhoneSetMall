package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.Brand;

import java.util.List;

public interface BrandMapper extends IBaseDao<Brand>{

    List<Brand> getAllBrand();

    Brand getBrandByBrandName(String brandName);
}