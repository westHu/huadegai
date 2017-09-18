package com.hup.dao;


import com.hup.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by peppa pig
 */
public interface UserDAO {

    List<User> getUserByUserName(@Param("userName") String userName);

}
