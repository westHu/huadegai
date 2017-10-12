package com.hup.dao;

import com.hup.entity.ProcessDefinition;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-10
 * Time: 16:35
 */
public interface ProcessDefinitionDao {


    List<ProcessDefinition> findAllDefinition();

    List<ProcessDefinition> findDefinitionStepByName(String name);

    ProcessDefinition findOne(String id);

    ProcessDefinition findDefinitionByNameAndStep(@Param("name") String name, @Param("step") Integer step);
}
