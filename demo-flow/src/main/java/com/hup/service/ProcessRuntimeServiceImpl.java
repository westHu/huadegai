package com.hup.service;

import com.hup.api.flow.ProcessRuntimeService;
import com.hup.dao.*;
import com.hup.entity.*;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.client.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 流程定义
 * User: west_
 * Date: 2017-10-10
 * Time: 16:30
 */
@Service
public class ProcessRuntimeServiceImpl implements ProcessRuntimeService {

    @Autowired
    private ProcessRuntimeDao processRuntimeDao;

    @Autowired
    private TaskDao taskDao;

    @Autowired
    private OrganizationDao organizationDao;

    @Autowired
    private UserDao userDao;


    @Override
    public List<ProcessRuntime> findAllRuntime() {
        return processRuntimeDao.findAllRuntime();
    }

    @Override
    public ProcessRuntime insertProcessRuntime(ProcessRuntime processRuntime, Boolean taskCreate){
        processRuntimeDao.insertProcessRuntime(processRuntime);
        //taskCreate 是否需要创建task的开关
        if (!taskCreate) {
            return processRuntime;
        }
        List<User> ownerList = new ArrayList<>();
        if (StringUtils.isNoneBlank(processRuntime.getGroups())){
            String groups = processRuntime.getGroups();
            if (StringUtils.isNotBlank(groups)) {
                for (String group : groups.split(",")) {
                    Organization organization = organizationDao.findOneByName(group);
                    if (null != organization) {
                        List<User> userList = userDao.findByOrganizationId(organization.getId());
                        if (CollectionUtils.isEmpty(userList)) continue;
                        ownerList.addAll(userList);
                    }
                }
            }
        }else if (StringUtils.isNoneBlank(processRuntime.getMembers())) {
            String members = processRuntime.getMembers();
            if (StringUtils.isNotBlank(members)) {
                for (String member : members.split(",")) {
                    User user = userDao.findByUsername(member);
                    if (null != user) {
                        ownerList.add(user);
                    }
                }
            }
        }
        if (CollectionUtils.isNotEmpty(ownerList)) {
            for (User user : ownerList ){
                ProcessTask toDoTask = new ProcessTask();

                toDoTask.setName("待办任务-" + processRuntime.getNameDesc() + "-" + processRuntime.getStepDesc() + DateUtils.formatDate(new Date(), "yyyyMMddHHmmss"));
                toDoTask.setCode(processRuntime.getCode());
                toDoTask.setUrl("/task/audit?processType=" + processRuntime.getName() + "&code=" + processRuntime.getCode() + "&step=" + processRuntime.getStep());
                toDoTask.setStatus("todo");
                toDoTask.setOwner(user.getUsername());
                taskDao.insertTodoTask(toDoTask);
            }
        }
        return processRuntime;
    }


    @Override
    public List<ProcessRuntime> findByCode(String code) {
        return processRuntimeDao.findByCode(code);
    }

    @Override
    public List<ProcessRuntime> findByCodeAndExecuted(String code, Boolean executed) {
        return processRuntimeDao.findByCodeAndExecuted(code, executed);
    }

    @Override
    public ProcessRuntime findByCodeAndStep(String code, Integer step) {
        return processRuntimeDao.findByCodeAndStep(code, step);
    }

    @Override
    public void updateRuntimeService(ProcessRuntime processRuntime) {
        processRuntimeDao.updateRuntimeService(processRuntime);
        taskDao.updateStatus(processRuntime.getCode(), "done");
    }

    @Override
    public List<ProcessRuntime> findRuntimeByName(String name) {
        return processRuntimeDao.findRuntimeByName(name);
    }


}
