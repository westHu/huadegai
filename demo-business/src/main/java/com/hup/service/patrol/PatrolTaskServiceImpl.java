package com.hup.service.patrol;

import com.hup.api.patrol.PatrolTaskService;
import com.hup.dao.PatrolTaskDao;
import com.hup.db.Pager;
import com.hup.entity.PatrolTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 13:03
 */
@Service
public class PatrolTaskServiceImpl implements PatrolTaskService {

    @Autowired
    private PatrolTaskDao patrolTaskDao;


    @Override
    public Pager<PatrolTask> queryPatrolTaskList(PatrolTask patrolTask, Pager<PatrolTask> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<PatrolTask> pointList = patrolTaskDao.queryPatrolTaskList(patrolTask, pager);
        int pointCount = patrolTaskDao.getPatrolTaskCount(patrolTask);
        pager.setList(pointList);
        pager.setTotalCount(pointCount);
        return pager;
    }

    @Override
    public PatrolTask insertTask(PatrolTask patrolTask) {
        patrolTaskDao.insertTask(patrolTask);
        return patrolTask;
    }

    @Override
    public void deleteTask(Long id) {
        patrolTaskDao.deleteTask(id);
    }

    @Override
    public PatrolTask getTask(Long id) {
        return patrolTaskDao.getTask(id);
    }

    @Override
    public void updateTask(PatrolTask patrolTask) {
        patrolTaskDao.updateTask(patrolTask);
    }
}
