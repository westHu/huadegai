package com.hup.dao;


import com.hup.entity.Organization;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>Organization: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface OrganizationDao {

    void createOrganization(@Param("organization") Organization organization);

    void updateOrganization(@Param("organization") Organization organization);

    void deleteOrganization(Long organizationId);

    Organization findOne(Long organizationId);

    List<Organization> findByParentId(Long parentId);

    List<Organization> findAll();

    List<Organization> findAllWithExclude(Organization excludeOraganization);

    void move(Organization source, Organization target);

    Organization findOneByName(String name);
}
