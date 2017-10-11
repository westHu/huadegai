package com.hup.service;

import com.hup.api.flow.ProcessDefinitionService;
import com.hup.api.flow.ProcessRuntimeService;
import com.hup.dao.ProcessDefinitionDao;
import com.hup.dao.ProcessRuntimeDao;
import com.hup.entity.ProcessDefinition;
import com.hup.entity.ProcessRuntime;
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
public class ProcessRuntimeServiceImpl implements ProcessRuntimeService {

    @Autowired
    private ProcessRuntimeDao processRuntimeDao;


    @Override
    public List<ProcessRuntime> findAllRuntime() {
        return processRuntimeDao.findAllRuntime();
    }

    @Override
    public ProcessRuntime insertProcessRuntime(ProcessRuntime processRuntime){
        processRuntimeDao.insertProcessRuntime(processRuntime);
        return processRuntime;
    }
}
