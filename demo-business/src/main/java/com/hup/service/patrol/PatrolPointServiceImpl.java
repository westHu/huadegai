package com.hup.service.patrol;

import com.hup.api.patrol.PatrolPointService;
import com.hup.dao.PatrolPointDao;
import com.hup.db.Pager;
import com.hup.entity.PatrolPoint;
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
public class PatrolPointServiceImpl implements PatrolPointService {

    @Autowired
    private PatrolPointDao patrolPointDao;


    @Override
    public Pager<PatrolPoint> queryPatrolPointList(PatrolPoint patrolPoint, Pager<PatrolPoint> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<PatrolPoint> pointList = patrolPointDao.queryPatrolPointList(patrolPoint, pager);
        int pointCount = patrolPointDao.getPatrolPointCount(patrolPoint);
        pager.setList(pointList);
        pager.setTotalCount(pointCount);
        return pager;
    }

    @Override
    public PatrolPoint insertPoint(PatrolPoint patrolPoint) {
        patrolPointDao.insertPoint(patrolPoint);
        return patrolPoint;
    }

    @Override
    public void deletePoint(Long id) {
        patrolPointDao.deletePoint(id);
    }

    @Override
    public PatrolPoint getPoint(Long id) {
        return patrolPointDao.getPoint(id);
    }

    @Override
    public void updatePoint(PatrolPoint patrolPoint) {
        patrolPointDao.updatePoint(patrolPoint);
    }
}
