package com.qf.service;


import com.qf.entity.Page;
import com.qf.entity.User;
import com.qf.entity.UserInfo;

import java.util.List;

public interface IUserService extends IBaseService<User> {


    User getUserByusername(String username);

    int toRgister(User user);

    Page<User> getAllUser(Page<User> page);

    boolean update(User user, UserInfo userInfo);

    boolean delete(int userId);

    Page<User> getUserByusernameList(Page<User> page, String byUserName);

    int deleteBatch(List<Integer> ids);
}
