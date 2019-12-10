package com.qf.service.impl;


import com.qf.dao.IBaseDao;
import com.qf.service.IBaseService;

/**
 * @author qq166
 */
public abstract class BaseServiceImpl<T> implements IBaseService<T> {
    public abstract IBaseDao<T> getDao();

    @Override
    public int deleteByPrimaryKey(int id) {
        return getDao().deleteByPrimaryKey(id);
    }

    @Override
    public int insert(T t) {
        return getDao().insert(t);
    }

    @Override
    public int insertSelective(T t) {
        return getDao().insertSelective(t);
    }

    @Override
    public T selectByPrimaryKey(int id) {
        return getDao().selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(T t) {
        return getDao().updateByPrimaryKeySelective(t);
    }

    @Override
    public int updateByPrimaryKey(T t) {
        return getDao().updateByPrimaryKey(t);
    }
}
