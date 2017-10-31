package com.hup.api.patrol;

import com.hup.db.Pager;
import com.hup.entity.PatrolPoint;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 12:59
 */
public interface PatrolPointService {


    Pager<PatrolPoint> queryPatrolPointList(PatrolPoint patrolPoint, Pager<PatrolPoint> pager);

    PatrolPoint insertPoint(PatrolPoint patrolPoint);

    void deletePoint(Long id);

    PatrolPoint getPoint(Long id);

    void updatePoint(PatrolPoint patrolPoint);

    List<PatrolPoint> findAllPatrolPoint();

    List<PatrolPoint> getAllPoint();
}
