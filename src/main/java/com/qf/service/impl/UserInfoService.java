package com.qf.service.impl;

import com.qf.dao.IBaseDao;
import com.qf.entity.UserInfo;
import com.qf.mapper.UserInfoMapper;
import com.qf.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author weimin
 * @ClassName UserInfoService
 * @Description TODO
 * @date 2019/10/12 14:59
 */
@Service
public class UserInfoService extends BaseServiceImpl<UserInfo> implements IUserInfoService {

    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public IBaseDao<UserInfo> getDao() {
        return userInfoMapper;
    }

    @Override
    public UserInfo getByUserId(int id) {
        return userInfoMapper.getByUserId(id);
    }
}
