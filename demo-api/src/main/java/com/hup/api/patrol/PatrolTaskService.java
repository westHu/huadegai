package com.hup.api.patrol;

import com.hup.db.Pager;
import com.hup.entity.PatrolTask;
import com.hup.entity.PatrolTaskDetail;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 12:59
 */
public interface PatrolTaskService {


    Pager<PatrolTask> queryPatrolTaskList(PatrolTask patrolTask, Pager<PatrolTask> pager);

    PatrolTask insertTask(PatrolTask patrolTask);

    void deleteTask(Long id);

    PatrolTask getTask(Long id);

    void updateTask(PatrolTask patrolTask);


    ///--------------------------detail
    void batchInsertTaskDetail(List<PatrolTaskDetail> taskDetails);
}
