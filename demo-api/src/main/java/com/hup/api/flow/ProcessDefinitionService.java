package com.hup.api.flow;

import com.hup.entity.ProcessDefinition;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-10
 * Time: 16:13
 */
public interface ProcessDefinitionService {

    List<ProcessDefinition> findAllDefinition();

    List<ProcessDefinition> findDefinitionStepByName(String name);


}
