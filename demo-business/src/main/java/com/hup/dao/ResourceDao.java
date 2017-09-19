package com.hup.dao;


import com.hup.entity.Resource;

import java.util.List;

/**
 * <p>Resource: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface ResourceDao {

    Resource createResource(Resource resource);

    Resource updateResource(Resource resource);

    void deleteResource(Long resourceId);

    Resource findOne(Long resourceId);

    List<Resource> findAll();

}
