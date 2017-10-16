package com.hup.api.flow;

import com.hup.db.Pager;
import com.hup.entity.ProcessTask;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-16
 * Time: 19:30
 */
public interface ProcessTaskService {

    Pager<ProcessTask> queryProcessTaskList(Pager<ProcessTask> pager, ProcessTask processTask);

    List<ProcessTask> processTaskList(ProcessTask processTask);

    void insertTodoTask(ProcessTask toDoTask);

    void updateStatus(String code, String status);


}
