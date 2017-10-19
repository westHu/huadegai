package com.hup.dao;


import com.hup.db.Pager;
import com.hup.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface RoleDao {

    void createRole(@Param("role") Role role);

    void updateRole(@Param("role") Role role);

    void deleteRole(Long roleId);

    Role findOne(Long roleId);

    List<Role> findAll();

    List<Role> queryRoleList(@Param("role") Role role, @Param("pager") Pager<Role> pager);

    int getRoleCount(@Param("role") Role role);
}
