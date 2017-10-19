package com.hup.dao;


import com.hup.db.Pager;
import com.hup.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface UserDao {

    List<User> queryUserList(@Param("user") User user, @Param("pager") Pager<User> pager);

    int getUserCount(@Param("user") User user);

    void createUser(@Param("user") User user);

    void updateUser(@Param("user") User user);

    void deleteUser(Long userId);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

    User findByEmail(String email);

    User findByMobile(String mobile);

    List<User> findByOrganizationId(Long organizationId);


}
