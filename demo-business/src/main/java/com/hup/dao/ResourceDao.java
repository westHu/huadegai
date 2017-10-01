package com.hup.dao;


import com.hup.entity.Resource;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>Resource: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface ResourceDao {

    void createResource(@Param("resource") Resource resource);

    void updateResource(@Param("resource") Resource resource);

    void deleteResource(Long resourceId);

    Resource findOne(Long resourceId);

    List<Resource> findAll();

    List<Resource> findByParentId(Long parentId);
}
