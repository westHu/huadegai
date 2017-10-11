package com.hup.dao;

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

    void insertProcessRuntime(@Param("runtime") ProcessRuntime runtime);
}
