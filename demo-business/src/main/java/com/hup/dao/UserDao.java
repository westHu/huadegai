package com.hup.dao;


import com.hup.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface UserDao {

    void createUser(@Param("user") User user);

    void updateUser(User user);

    void deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

}
