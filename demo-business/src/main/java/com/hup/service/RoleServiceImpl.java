package com.hup.service;

import com.hup.api.ResourceService;
import com.hup.api.RoleService;
import com.hup.dao.RoleDao;
import com.hup.db.Pager;
import com.hup.entity.Resource;
import com.hup.entity.Role;
import com.hup.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;
    @Autowired
    private ResourceService resourceService;

    public Role createRole(Role role) {
        roleDao.createRole(role);
        return role;
    }

    public Role updateRole(Role role) {
        roleDao.updateRole(role);
        return role;
    }

    public void deleteRole(Long roleId) {
        roleDao.deleteRole(roleId);
    }

    @Override
    public Role findOne(Long roleId) {
        Role one = roleDao.findOne(roleId);
        Set<String> resourceNames = new HashSet<>();
        one.getResourceIds().forEach(resourceId -> {
            Resource resource = resourceService.findOne(resourceId);
            if (null != resource){
                resourceNames.add(resource.getName());
            }
        });
        one.setResourceNames(resourceNames.toString());
        return one;
    }

    @Override
    public List<Role> findAll() {
        List<Role> roles = roleDao.findAll();
        roles.forEach((Role role) -> {
            Set<String> set = new HashSet<>();
            for (Long aLong : role.getResourceIds()) {
                set.add(resourceService.findOne(aLong).getName());
            }
            role.setResourceNames(set.toString());
        });
        return roles;
    }


    @Override
    public Pager<Role> queryRoleList(Role role, Pager<Role> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<Role> roleList = roleDao.queryRoleList(role, pager);
        roleList.forEach(obj -> {
            Set<String> set = new HashSet<>();
            for (Long aLong : obj.getResourceIds()) {
                set.add(resourceService.findOne(aLong).getName());
            }
            obj.setResourceNames(set.toString());
        });
        int roleCount = roleDao.getRoleCount(role);
        pager.setList(roleList);
        pager.setTotalCount(roleCount);
        return pager;
    }


    @Override
    public Set<String> findRoles(Long... roleIds) {
        Set<String> roles = new HashSet<String>();
        for(Long roleId : roleIds) {
            Role role = findOne(roleId);
            if(role != null) {
                roles.add(role.getRole());
            }
        }
        return roles;
    }

    @Override
    public Set<String> findRolesDesc(Long... roleIds) {
        Set<String> roleDescs = new HashSet<String>();
        for(Long roleId : roleIds) {
            Role role = findOne(roleId);
            if(role != null) {
                roleDescs.add(role.getDescription());
            }
        }
        return roleDescs;
    }


    @Override
    public Set<String> findPermissions(Long[] roleIds) {
        Set<Long> resourceIds = new HashSet<Long>();
        for(Long roleId : roleIds) {
            Role role = findOne(roleId);
            if(role != null) {
                resourceIds.addAll(role.getResourceIds());
            }
        }
        return resourceService.findPermissions(resourceIds);
    }
}
