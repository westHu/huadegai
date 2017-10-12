package com.hup.service;

import com.hup.api.flow.ProcessDefinitionService;
import com.hup.dao.ProcessDefinitionDao;
import com.hup.entity.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 流程定义
 * User: west_
 * Date: 2017-10-10
 * Time: 16:30
 */
@Service
public class ProcessDefinitionServiceImpl implements ProcessDefinitionService {

    @Autowired
    private ProcessDefinitionDao processDefinitionDao;


    @Override
    public List<ProcessDefinition> findAllDefinition() {
        return processDefinitionDao.findAllDefinition();
    }

    @Override
    public List<ProcessDefinition> findDefinitionStepByName(String name) {
        return processDefinitionDao.findDefinitionStepByName(name);
    }

    @Override
    public ProcessDefinition findOne(String id) {
        return processDefinitionDao.findOne(id);
    }

    @Override
    public ProcessDefinition findDefinitionByNameAndStep(String name, Integer step) {
        return processDefinitionDao.findDefinitionByNameAndStep(name, step);
    }


}
