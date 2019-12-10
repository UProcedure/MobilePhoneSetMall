package com.qf.service;

import com.qf.entity.UserInfo;

/**
 * @author qq166
 */
public interface IUserInfoService extends IBaseService<UserInfo> {
    UserInfo getByUserId(int id);
}
