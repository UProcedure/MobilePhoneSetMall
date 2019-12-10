package com.qf.service.impl;

import com.github.pagehelper.PageHelper;
import com.qf.dao.IBaseDao;
import com.qf.entity.Page;
import com.qf.entity.User;
import com.qf.entity.UserInfo;
import com.qf.mapper.OrderMapper;
import com.qf.mapper.UserInfoMapper;
import com.qf.mapper.UserMapper;
import com.qf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author qq166
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserInfoMapper userInfoMapper;
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public IBaseDao<User> getDao() {
        return userMapper;
    }

    @Override
    public User getUserByusername(String username) {
        return userMapper.getUserByusername(username);
    }

    @Override
    public int toRgister(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public Page<User> getAllUser(Page<User> page) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<User> allUser = userMapper.getAllUser();
        return new Page<>(allUser);
    }

    @Override
    public boolean update(User user, UserInfo userInfo) {
        int i = userMapper.updateByPrimaryKeySelective(user);
        userInfo.setUserId(user.getId());
        UserInfo userInfo1 = userInfoMapper.getByUserId(user.getId());
        int i1 = 0;
        if(userInfo1!=null){
            i1 = userInfoMapper.updateByUserId(userInfo);
        }else {
            i1 = userInfoMapper.insertSelective(userInfo);
        }
        if((i>0)&&(i1>0)){
            return true;
        }
        return false;
    }

    @Override
    public boolean delete(int userId) {
        int i = userMapper.deleteByPrimaryKey(userId);
        int i1 = userInfoMapper.deleteByPrimaryKey(userId);
        orderMapper.deleteByUserId(userId);
        if((i>0)||(i1>0)){
            return true;
        }
        return false;
    }

    @Override
    public Page<User> getUserByusernameList(Page<User> page, String byUserName) {
        PageHelper.startPage(page.getCurrentPage(),page.getPageSize());
        List<User> list = userMapper.getUserByusernameList(byUserName);
        return new Page<>(list);
    }

    @Override
    public int deleteBatch(List<Integer>ids) {
        userInfoMapper.deleteBatch(ids);
        return userMapper.deleteBatch(ids);
    }


}
