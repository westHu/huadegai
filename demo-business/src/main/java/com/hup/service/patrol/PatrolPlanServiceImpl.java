package com.hup.service.patrol;

import com.hup.api.patrol.PatrolPlanService;
import com.hup.dao.PatrolPlanDao;
import com.hup.db.Pager;
import com.hup.entity.PatrolPlan;
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
public class PatrolPlanServiceImpl implements PatrolPlanService {

    @Autowired
    private PatrolPlanDao patrolPlanDao;


    @Override
    public Pager<PatrolPlan> queryPatrolPlanList(PatrolPlan patrolPlan, Pager<PatrolPlan> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<PatrolPlan> pointList = patrolPlanDao.queryPatrolPlanList(patrolPlan, pager);
        int pointCount = patrolPlanDao.getPatrolPlanCount(patrolPlan);
        pager.setList(pointList);
        pager.setTotalCount(pointCount);
        return pager;
    }

    @Override
    public PatrolPlan insertPlan(PatrolPlan patrolPlan) {
        patrolPlanDao.insertPlan(patrolPlan);
        return patrolPlan;
    }

    @Override
    public void deletePlan(Long id) {
        patrolPlanDao.deletePlan(id);
    }

    @Override
    public PatrolPlan getPlan(Long id) {
        return patrolPlanDao.getPlan(id);
    }

    @Override
    public void updatePlan(PatrolPlan patrolPlan) {
        patrolPlanDao.updatePlan(patrolPlan);
    }
}
