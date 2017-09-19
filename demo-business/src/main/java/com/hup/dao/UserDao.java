package com.hup.dao;


import com.hup.dto.UserDto;
import com.hup.entity.User;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface UserDao {

    User createUser(User user);

    User updateUser(User user);

    void deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    List<UserDto> findAllUser();

    User findByUsername(String username);

}
