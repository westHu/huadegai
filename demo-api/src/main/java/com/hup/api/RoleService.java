package com.hup.api;


import com.hup.db.Pager;
import com.hup.entity.Role;

import java.util.List;
import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface RoleService {


    Role createRole(Role role);
    Role updateRole(Role role);
    void deleteRole(Long roleId);

    Role findOne(Long roleId);
    List<Role> findAll();

    Pager<Role> queryRoleList(Role role, Pager<Role> pager);

    /**
     * 根据角色编号得到角色标识符列表
     * @param roleIds
     * @return
     */
    Set<String> findRoles(Long... roleIds);

    /**
     * 根据角色编号得到角色描述列表
     * @param roleIds
     * @return
     */
    Set<String> findRolesDesc(Long... roleIds);

    /**
     * 根据角色编号得到权限字符串列表
     * @param roleIds
     * @return
     */
    Set<String> findPermissions(Long[] roleIds);


}
