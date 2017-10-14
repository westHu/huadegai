package com.hup.service;

import com.hup.dao.TaskDao;
import com.hup.entity.ProcessTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 任务Service，用于管理和查询任务，例如签收、办理、指派等
 * User: west_
 * Date: 2017-10-10
 * Time: 13:33
 */
@Service
public class TaskService {

    @Autowired
    private TaskDao taskDao;

    public List<ProcessTask> processTaskList(ProcessTask processTask) {
        return taskDao.processTaskList(processTask);

    }
}
