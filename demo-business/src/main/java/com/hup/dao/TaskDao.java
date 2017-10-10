package com.hup.dao;


import com.hup.entity.ToDoTask;
import com.hup.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-1-28
 * <p>Version: 1.0
 */
public interface TaskDao {

    List<ToDoTask> toDoList(@Param("toDoTask") ToDoTask toDoTask);
}
