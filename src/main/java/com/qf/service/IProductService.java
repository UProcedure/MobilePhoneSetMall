package com.qf.service;

import com.qf.entity.Product;

import java.util.List;

/**
 * @author qq166
 */
public interface IProductService extends IBaseService<Product> {
    List<Product> getAllProduct();

    Product getProductByProductName(String productName);

    boolean deleteByProductId(Integer productId);
}
