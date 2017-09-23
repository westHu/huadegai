package com.hup.dao;


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
}
