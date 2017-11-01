package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.PatrolPoint;
import com.hup.entity.PatrolPointDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 13:06
 */
public interface PatrolPointDao {

    List<PatrolPoint> queryPatrolPointList(@Param("patrolPoint") PatrolPoint patrolPoint,
                                           @Param("pager") Pager<PatrolPoint> pager);

    int getPatrolPointCount(@Param("patrolPoint") PatrolPoint patrolPoint);

    int insertPoint(@Param("patrolPoint") PatrolPoint patrolPoint);

    int insertPointDetail(@Param("pointDetail") PatrolPointDetail patrolPointDetail);

    void deletePoint(Long id);

    PatrolPoint getPoint(Long id);

    void updatePoint(@Param("patrolPoint") PatrolPoint patrolPoint);

    List<PatrolPoint> findAllPatrolPoint();


}
