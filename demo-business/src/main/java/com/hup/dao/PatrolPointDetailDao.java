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
public interface PatrolPointDetailDao {

    List<PatrolPointDetail> queryPatrolPointDetailList(@Param("patrolPointDetail") PatrolPointDetail patrolPointDetail,
                                           @Param("pager") Pager<PatrolPointDetail> pager);

    int getPatrolPointDetailCount(@Param("patrolPointDetail") PatrolPointDetail patrolPointDetail);

    int insertPointDetail(@Param("patrolPointDetail") PatrolPointDetail patrolPointDetail);

    void deletePointDetail(Long id);

    PatrolPointDetail getPointDetail(Long id);

    void updatePointDetail(@Param("patrolPointDetail") PatrolPointDetail patrolPointDetail);

    List<PatrolPointDetail> findAllPatrolPointDetail();

}
