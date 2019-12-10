package com.qf.dao;

public interface IBaseDao<T>{
    int deleteByPrimaryKey(int id);

    int insert(T t);

    int insertSelective(T t);

    T selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(T t);

    int updateByPrimaryKey(T t);
}
