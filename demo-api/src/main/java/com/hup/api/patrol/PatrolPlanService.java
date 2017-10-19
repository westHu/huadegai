package com.hup.api.patrol;

import com.hup.db.Pager;
import com.hup.entity.PatrolPlan;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 12:59
 */
public interface PatrolPlanService {


    Pager<PatrolPlan> queryPatrolPlanList(PatrolPlan patrolPlan, Pager<PatrolPlan> pager);

    PatrolPlan insertPlan(PatrolPlan patrolPlan);

    void deletePlan(Long id);

    PatrolPlan getPlan(Long id);

    void updatePlan(PatrolPlan patrolPlan);
}
