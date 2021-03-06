package com.hup.service;

import com.hup.api.ResourceService;
import com.hup.api.RoleService;
import com.hup.dao.RoleDao;
import com.hup.entity.Resource;
import com.hup.entity.Role;
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
