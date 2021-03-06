package com.hup.api;


import com.hup.entity.Organization;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface OrganizationService {


    public Organization createOrganization(Organization organization);

    public Organization updateOrganization(Organization organization);

    public void deleteOrganization(Long organizationId);

    Organization findOne(Long organizationId);

    List<Organization> findByParentId(Long parentId);

    List<Organization> findAll();

    String getOrganizationTree();

    Object findAllWithExclude(Organization excludeOraganization);

    void move(Organization source, Organization target);
}
