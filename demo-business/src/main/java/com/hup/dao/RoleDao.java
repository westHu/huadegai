package com.hup.dao;


import com.hup.entity.Role;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface RoleDao {

    Role createRole(Role role);

    Role updateRole(Role role);

    void deleteRole(Long roleId);

    Role findOne(Long roleId);

    List<Role> findAll();
}
