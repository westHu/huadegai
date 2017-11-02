package com.hup.service.patrol;

import com.hup.api.patrol.PatrolPlanService;
import com.hup.dao.PatrolPlanDao;
import com.hup.dao.PatrolPointDetailDao;
import com.hup.db.Pager;
import com.hup.entity.PatrolPlan;
import com.hup.entity.PatrolPlanDetail;
import com.hup.entity.PatrolPointDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    @Autowired
    private PatrolPointDetailDao patrolPointDetailDao;


    @Override
    public List<PatrolPlan> getAllPatrolPlan() {
        return patrolPlanDao.getAllPatrolPlan();
    }

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

        String[] split = patrolPlan.getPointDetailIds().split(",");
        List<PatrolPlanDetail> detailList = new ArrayList<>();
        for (String id : split) {
            PatrolPointDetail pointDetail = patrolPointDetailDao.getPointDetail(Long.parseLong(id));
            if (null != pointDetail) {
                PatrolPlanDetail planDetail = new PatrolPlanDetail();
                planDetail.setPlanId(patrolPlan.getId());
                planDetail.setPointId(pointDetail.getPointId());
                planDetail.setDeviceCode(pointDetail.getDeviceCode());
                planDetail.setTags(pointDetail.getPatrolNotice());
                detailList.add(planDetail);
            }
        }
        patrolPlanDao.batchInsertPlanDetail(detailList);

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

    @Override
    public int updateStatus(PatrolPlan patrolPlan) {
       return patrolPlanDao.updateStatus(patrolPlan);
    }
}
