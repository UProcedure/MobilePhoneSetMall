package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.UserInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author qq166
 */
public interface UserInfoMapper extends IBaseDao<UserInfo> {

    int deleteBatch(@Param("ids") List<Integer> ids);

    UserInfo getByUserId(int id);

    int updateByUserId(UserInfo userInfo);
}