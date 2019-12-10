package com.qf.service;

public interface IBaseService<T>{
    int deleteByPrimaryKey(int id);

    int insert(T t);

    int insertSelective(T t);

    T selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(T t);

    int updateByPrimaryKey(T t);

}
