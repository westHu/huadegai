package com.hup.dao;


import com.hup.db.Pager;
import com.hup.entity.ProcessTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface ProcessTaskDao {

    List<ProcessTask> queryProcessTaskList(@Param("processTask") ProcessTask processTask, @Param("pager") Pager<ProcessTask> pager);

    int getProcessTaskCount(@Param("processTask") ProcessTask processTask);

    List<ProcessTask> processTaskList(@Param("processTask") ProcessTask processTask);

    void insertTodoTask(@Param("toDoTask") ProcessTask toDoTask);

    void updateStatus(@Param("code") String code, @Param("status") String status);



}
