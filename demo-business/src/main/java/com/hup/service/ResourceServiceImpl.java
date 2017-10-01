package com.hup.service;

import com.alibaba.fastjson.JSON;
import com.hup.api.ResourceService;
import com.hup.dao.ResourceDao;
import com.hup.entity.Organization;
import com.hup.entity.Resource;
import org.apache.commons.collections.CollectionUtils;
import org.apache.shiro.authz.permission.WildcardPermission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Service

public class ResourceServiceImpl implements ResourceService {

    @Autowired
    private ResourceDao resourceDao;

    @Override
    public Resource createResource(Resource resource) {
        resourceDao.createResource(resource);
        return resource;
    }

    @Override
    public Resource updateResource(Resource resource) {
        resourceDao.updateResource(resource);
        return resource;
    }

    @Override
    public void deleteResource(Long resourceId) {
        resourceDao.deleteResource(resourceId);
    }

    @Override
    public Resource findOne(Long resourceId) {
        return resourceDao.findOne(resourceId);
    }

    @Override
    public List<Resource> findAll() {
        return resourceDao.findAll();
    }

    @Override
    public String getResourceTree() {
        List<Resource> tree = findTree(0L);
        String jsonString = JSON.toJSONString(tree);
        String result = jsonString.replaceAll("name","text")
                .replaceAll("childrenList","nodes")
                .replaceAll("parentIds","tags");
        return result;
    }
    private List<Resource> findTree(Long parentId) {
        List<Resource> resources = findByParentId(parentId);
        if (CollectionUtils.isNotEmpty(resources)){
            for (Resource resource : resources){
                List<Resource> tree = findTree(resource.getId());
                List<String> tags = new ArrayList<>();
                tags.add(String.valueOf(tree.size()));
                resource.setTags(tags);
                resource.setChildrenList(tree);
            }
        }
        return resources;
    }

    @Override
    public List<Resource> findByParentId(Long parentId) {
        return resourceDao.findByParentId(parentId);
    }

    @Override
    public Set<String> findPermissions(Set<Long> resourceIds) {
        Set<String> permissions = new HashSet<String>();
        for(Long resourceId : resourceIds) {
            Resource resource = findOne(resourceId);
            if(resource != null && !StringUtils.isEmpty(resource.getPermission())) {
                permissions.add(resource.getPermission());
            }
        }
        return permissions;
    }

    @Override
    public List<Resource> findMenus(Set<String> permissions) {
        List<Resource> allResources = findAll();
        List<Resource> menus = new ArrayList<Resource>();
        for(Resource resource : allResources) {
            if(resource.isRootNode()) {
                continue;
            }
            if(resource.getType() != Resource.ResourceType.menu) {
                continue;
            }
            if(!hasPermission(permissions, resource)) {
                continue;
            }
            menus.add(resource);
        }
        return menus;
    }

    private boolean hasPermission(Set<String> permissions, Resource resource) {
        if(StringUtils.isEmpty(resource.getPermission())) {
            return true;
        }
        for(String permission : permissions) {
            WildcardPermission p1 = new WildcardPermission(permission);
            WildcardPermission p2 = new WildcardPermission(resource.getPermission());
            if(p1.implies(p2) || p2.implies(p1)) {
                return true;
            }
        }
        return false;
    }
}
