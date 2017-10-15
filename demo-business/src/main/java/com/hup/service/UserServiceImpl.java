package com.hup.service;

import com.alibaba.fastjson.JSON;
import com.hup.api.RoleService;
import com.hup.api.UserService;
import com.hup.dao.OrganizationDao;
import com.hup.dao.UserDao;
import com.hup.entity.Organization;
import com.hup.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private OrganizationDao organizationDao;

    @Autowired
    private PasswordHelper passwordHelper;

    @Autowired
    private RoleService roleService;

    /**
     * 创建用户
     * @param user
     */
    public User createUser(User user) {
        //加密密码
        passwordHelper.encryptPassword(user);
        userDao.createUser(user);
        return user;
    }

    @Override
    public User updateUser(User user) {
        userDao.updateUser(user);
        return user;
    }

    @Override
    public void deleteUser(Long userId) {
        userDao.deleteUser(userId);
    }

    /**
     * 修改密码
     * @param userId
     * @param newPassword
     */
    public void changePassword(Long userId, String newPassword) {
        User user = userDao.findOne(userId);
        user.setPassword(newPassword);
        passwordHelper.encryptPassword(user);
        userDao.updateUser(user);
    }

    @Override
    public User findOne(Long userId) {
        return userDao.findOne(userId);
    }

    @Override
    public List<User> findAll() {
        List<User> userList = userDao.findAll();
        userList.forEach((User user) -> {
            String name  = user.getUsername();
            Set<String> roles = findRoles(name);
            user.setRoleNames(roles.toString());
        });
        return userList;
    }

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }


    @Override
    public User findByEmail(String email) {
        return userDao.findByEmail(email);
    }

    @Override
    public User findByMobile(String mobile) {
        return userDao.findByMobile(mobile);
    }

    /**
     * 根据用户名查找其角色
     * @param username
     * @return
     */
    public Set<String> findRoles(String username) {
        User user = findByUsername(username);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findRoles(user.getRoleIds().toArray(new Long[0]));
    }

    @Override
    public Set<String> findRolesByEmail(String email) {
        User user = findByEmail(email);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findRoles(user.getRoleIds().toArray(new Long[0]));
    }

    @Override
    public Set<String> findRolesByMobile(String mobile) {
        User user = findByMobile(mobile);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findRoles(user.getRoleIds().toArray(new Long[0]));
    }

    /**
     * 根据用户名查找其权限
     * @param username
     * @return
     */
    public Set<String> findPermissions(String username) {
        User user = findByUsername(username);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findPermissions(user.getRoleIds().toArray(new Long[0]));
    }

    @Override
    public Set<String> findPermissionsByEmail(String email) {
        User user = findByEmail(email);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findPermissions(user.getRoleIds().toArray(new Long[0]));
    }

    @Override
    public Set<String> findPermissionsByMobile(String mobile) {
        User user = findByMobile(mobile);
        if(user == null) {
            return Collections.EMPTY_SET;
        }
        return roleService.findPermissions(user.getRoleIds().toArray(new Long[0]));
    }


    @Override
    public boolean resetPassword(Long id) {
        User user = userDao.findOne(id);
        passwordHelper.encryptPassword(user);
        userDao.updateUser(user);
        return true;
    }

    /**
     * <p>@Description: 获取某人的leaders
     * <p>@Author: hupj
     * <p>@Date: 2017/10/11
     * <p>@Param:
     * <p>@return:
     */
    @Override
    public String findLeaders(String username) {
        User user = userDao.findByUsername(username);
        if (null == user) return null;
        Organization organization = organizationDao.findOne(user.getOrganizationId());
        Organization parent = organizationDao.findOne(organization.getParentId());
        if (parent != null) {
            return parent.getLeaders();
        }
        return null;
    }

    @Override
    public String getUserTree() {
        String jsonString = JSON.toJSONString(findAll());
        String result = jsonString.replaceAll("name","text");
        return result;
    }

}
