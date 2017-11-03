package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.PatrolTask;
import com.hup.entity.PatrolTaskDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 13:06
 */
public interface PatrolTaskDao {

    List<PatrolTask> queryPatrolTaskList(@Param("patrolTask") PatrolTask patrolTask,
                                         @Param("pager") Pager<PatrolTask> pager);

    int getPatrolTaskCount(@Param("patrolTask") PatrolTask patrolTask);

    int insertTask(@Param("patrolTask") PatrolTask patrolTask);

    void deleteTask(Long id);

    PatrolTask getTask(Long id);

    void updateTask(@Param("patrolTask") PatrolTask patrolTask);


    //-----------------detail -----------------
    void batchInsertTaskDetail(@Param("taskDetails") List<PatrolTaskDetail> taskDetails);
}
