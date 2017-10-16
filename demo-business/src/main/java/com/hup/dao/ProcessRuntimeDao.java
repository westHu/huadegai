package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.ProcessRuntime;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-10
 * Time: 16:35
 */
public interface ProcessRuntimeDao {


    List<ProcessRuntime> findAllRuntime();

    List<ProcessRuntime> queryRuntimeList(@Param("processRuntime") ProcessRuntime processRuntime, @Param("pager") Pager<ProcessRuntime> pager);

    int getRuntimeCount(@Param("processRuntime") ProcessRuntime processRuntime);

    void insertProcessRuntime(@Param("runtime") ProcessRuntime runtime);

    List<ProcessRuntime> findByCode(@Param("code") String code);

    List<ProcessRuntime> findByCodeAndExecuted(@Param("code") String code, @Param("executed") Boolean executed);

    ProcessRuntime findByCodeAndStep(@Param("code") String code, @Param("step") Integer step);

    void updateRuntimeService(ProcessRuntime processRuntime);

    List<ProcessRuntime> findRuntimeByName(@Param("name") String name);


}
