package com.hup.api.patrol;

import com.hup.db.Pager;
import com.hup.entity.PatrolPointDetail;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-17
 * Time: 12:59
 */
public interface PatrolPointDetailService {

    List<PatrolPointDetail> getAllPointDetail();

    Pager<PatrolPointDetail> queryPatrolPointDetailList(PatrolPointDetail patrolPointDetail, Pager<PatrolPointDetail> pager);

    PatrolPointDetail insertPointDetail(PatrolPointDetail patrolPointDetail);

    void deletePointDetail(Long id);

    PatrolPointDetail getPointDetail(Long id);

    void updatePointDetail(PatrolPointDetail patrolPointDetail);

    List<PatrolPointDetail> findAllPatrolPointDetail();


}
