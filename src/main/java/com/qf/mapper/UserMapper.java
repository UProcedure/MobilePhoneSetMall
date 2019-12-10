package com.qf.mapper;

import com.qf.dao.IBaseDao;
import com.qf.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author qq166
 */
public interface UserMapper extends IBaseDao<User> {

    User getUserByusername(String username);

    List<User> getAllUser();

    List<User> getUserByusernameList(String byUserName);

    int deleteBatch(@Param("ids") List<Integer> ids);
}