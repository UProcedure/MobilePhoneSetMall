package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.Product;

import java.util.List;

public interface ProductMapper extends IBaseDao<Product> {

    List<Product> getAllProduct();

    Product getProductByProductName(String productName);
}