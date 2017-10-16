package com.hup.service;

import com.alibaba.fastjson.JSON;
import com.hup.api.OrganizationService;
import com.hup.dao.OrganizationDao;
import com.hup.entity.Organization;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {
    @Autowired
    private OrganizationDao organizationDao;

    @Override
    public Organization createOrganization(Organization organization) {
        organizationDao.createOrganization(organization);
        return organization;
    }

    @Override
    public Organization updateOrganization(Organization organization) {
        organizationDao.updateOrganization(organization);
        return organization;
    }

    @Override
    public void deleteOrganization(Long organizationId) {
        organizationDao.deleteOrganization(organizationId);
    }

    @Override
    public Organization findOne(Long organizationId) {
        Organization one = organizationDao.findOne(organizationId);
        Organization parentOne = organizationDao.findOne(one.getParentId());
        one.setParentName(parentOne.getName());
        return one;
    }

    @Override
    public List<Organization> findByParentId(Long parentId) {
        List<Organization> byParentId = organizationDao.findByParentId(parentId);
        for (Organization organization : byParentId){
            Organization parentOne = organizationDao.findOne(organization.getParentId());
            if (null != parentOne){
                organization.setParentName(parentOne.getName());
            }
        }
        return byParentId;
    }

    @Override
    public List<Organization> findAll() {
        List<Organization> byParentId = organizationDao.findAll();
        for (Organization organization : byParentId){
            Organization parentOne = organizationDao.findOne(organization.getParentId());
            if (null != parentOne){
                organization.setParentName(parentOne.getName());
            }
        }
        return byParentId;
    }

    @Override
    public List<Organization> findSampleOrganizationList() {
        return organizationDao.findAll();
    }

    @Override
    public String getOrganizationTree() {
        List<Organization> tree = findTree(0L);
        String jsonString = JSON.toJSONString(tree);
        String result = jsonString.replaceAll("name","text")
                .replaceAll("childrenList","nodes")
                .replaceAll("parentIds","tags");
        return result;
    }
    private List<Organization> findTree(Long parentId) {
        List<Organization> organizations = findByParentId(parentId);
        if (CollectionUtils.isNotEmpty(organizations)){
            for (Organization organization : organizations){
                List<Organization> tree = findTree(organization.getId());
                List<String> tags = new ArrayList<>();
                tags.add(String.valueOf(tree.size()));
                organization.setTags(tags);
                organization.setChildrenList(tree);
            }
        }
        return organizations;
    }


    @Override
    public List<Organization> findAllWithExclude(Organization excludeOraganization) {
        return organizationDao.findAllWithExclude(excludeOraganization);
    }

    @Override
    public void move(Organization source, Organization target) {
        organizationDao.move(source, target);
    }
}
