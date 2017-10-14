package com.hup.dao;


import com.hup.entity.ProcessTask;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface TaskDao {

    List<ProcessTask> processTaskList(@Param("processTask") ProcessTask processTask);

    void insertTodoTask(@Param("toDoTask") ProcessTask toDoTask);
}
