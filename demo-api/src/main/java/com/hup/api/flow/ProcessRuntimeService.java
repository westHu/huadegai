package com.hup.api.flow;

import com.hup.db.Pager;
import com.hup.entity.ProcessRuntime;
import com.hup.entity.ProcessTask;

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

    Pager<ProcessRuntime> queryRuntimeListByName(Pager<ProcessRuntime> pager, ProcessRuntime processRuntime);

    ProcessRuntime insertProcessRuntime(ProcessRuntime processRuntime, Boolean taskCreate);

    List<ProcessRuntime> findByCode(String code);

    List<ProcessRuntime> findByCodeAndExecuted(String code, Boolean executed);

    ProcessRuntime findByCodeAndStep(String code, Integer step);

    void updateRuntimeService(ProcessRuntime processRuntime);

    List<ProcessRuntime> findRuntimeByName(String name);


}
