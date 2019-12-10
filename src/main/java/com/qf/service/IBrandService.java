package com.qf.service;

import com.qf.entity.Brand;

import java.util.List;

/**
 * @author qq166
 */
public interface IBrandService extends IBaseService<Brand>{

    List<Brand> getAllBrand();

    Brand getBrandByBrandName(String brandName);

    boolean deleteByBrandId(Integer brandId);
}
