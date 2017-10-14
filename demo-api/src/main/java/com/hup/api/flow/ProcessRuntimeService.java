package com.hup.api.flow;

import com.hup.entity.ProcessRuntime;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-10
 * Time: 16:14
 */
public interface ProcessRuntimeService {

    List<ProcessRuntime> findAllRuntime();

    ProcessRuntime insertProcessRuntime(ProcessRuntime processRuntime);

    List<ProcessRuntime> findByCode(String code);
}
