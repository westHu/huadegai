package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.PatrolPlan;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 13:06
 */
public interface PatrolPlanDao {

    List<PatrolPlan> getAllPatrolPlan();

    List<PatrolPlan> queryPatrolPlanList(@Param("patrolPlan") PatrolPlan patrolPlan,
                                         @Param("pager") Pager<PatrolPlan> pager);

    int getPatrolPlanCount(@Param("patrolPlan") PatrolPlan patrolPlan);

    int insertPlan(@Param("patrolPlan") PatrolPlan patrolPlan);

    void deletePlan(Long id);

    PatrolPlan getPlan(Long id);

    void updatePlan(@Param("patrolPlan") PatrolPlan patrolPlan);

    int updateStatus(@Param("patrolPlan")PatrolPlan patrolPlan);
}
