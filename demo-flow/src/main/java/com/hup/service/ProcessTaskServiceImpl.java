package com.hup.service;

import com.hup.api.flow.ProcessTaskService;
import com.hup.dao.ProcessTaskDao;
import com.hup.db.Pager;
import com.hup.entity.ProcessRuntime;
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
public class ProcessTaskServiceImpl implements ProcessTaskService{

    @Autowired
    private ProcessTaskDao processTaskDao;

    @Override
    public Pager<ProcessTask> queryProcessTaskList(Pager<ProcessTask> pager, ProcessTask processTask) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<ProcessTask> taskList = processTaskDao.queryProcessTaskList(processTask, pager);
        int taskCount = processTaskDao.getProcessTaskCount(processTask);
        pager.setList(taskList);
        pager.setTotalCount(taskCount);
        return pager;
    }

    public List<ProcessTask> processTaskList(ProcessTask processTask) {
        return processTaskDao.processTaskList(processTask);

    }

    @Override
    public void insertTodoTask(ProcessTask toDoTask) {

    }

    @Override
    public void updateStatus(String code, String status) {

    }
}
