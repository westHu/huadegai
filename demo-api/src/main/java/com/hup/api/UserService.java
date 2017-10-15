package com.hup.api;


import com.hup.entity.User;

import java.util.List;
import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface UserService {

    /**
     * 创建用户
     * @param user
     */
    User createUser(User user);

    User updateUser(User user);

    void deleteUser(Long userId);

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    void changePassword(Long userId, String newPassword);

    User findOne(Long userId);

    List<User> findAll();

    User findByUsername(String username);

    User findByEmail(String email);

    User findByMobile(String mobile);
    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    Set<String> findRoles(String username);

    Set<String> findRolesByEmail(String email);

    Set<String> findRolesByMobile(String mobile);
    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     */
    Set<String> findPermissions(String username);

    Set<String> findPermissionsByEmail(String email);

    Set<String> findPermissionsByMobile(String mobile);

    boolean resetPassword(Long id);

    /**
     * 查询用户的所有上级领导
     */
    String findLeaders(String username);

    String getUserTree();

}
