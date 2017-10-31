package com.hup.service.patrol;

import com.hup.api.patrol.PatrolPointDetailService;
import com.hup.api.patrol.PatrolPointService;
import com.hup.dao.PatrolPointDao;
import com.hup.dao.PatrolPointDetailDao;
import com.hup.db.Pager;
import com.hup.entity.PatrolPoint;
import com.hup.entity.PatrolPointDetail;
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
public class PatrolPointDetailServiceImpl implements PatrolPointDetailService {

    @Autowired
    private PatrolPointDetailDao patrolPointDetailDao;


    @Override
    public Pager<PatrolPointDetail> queryPatrolPointDetailList(PatrolPointDetail patrolPointDetail, Pager<PatrolPointDetail> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<PatrolPointDetail> PointDetailList = patrolPointDetailDao.queryPatrolPointDetailList(patrolPointDetail, pager);
        int PointDetailCount = patrolPointDetailDao.getPatrolPointDetailCount(patrolPointDetail);
        pager.setList(PointDetailList);
        pager.setTotalCount(PointDetailCount);
        return pager;
    }

    @Override
    public PatrolPointDetail insertPointDetail(PatrolPointDetail patrolPointDetail) {
        patrolPointDetailDao.insertPointDetail(patrolPointDetail);
        return patrolPointDetail;
    }

    @Override
    public void deletePointDetail(Long id) {
        patrolPointDetailDao.deletePointDetail(id);
    }

    @Override
    public PatrolPointDetail getPointDetail(Long id) {
        return patrolPointDetailDao.getPointDetail(id);
    }

    @Override
    public void updatePointDetail(PatrolPointDetail patrolPointDetail) {
        patrolPointDetailDao.updatePointDetail(patrolPointDetail);
    }

    @Override
    public List<PatrolPointDetail> findAllPatrolPointDetail() {
        return patrolPointDetailDao.findAllPatrolPointDetail();
    }

    @Override
    public List<PatrolPointDetail> getAllPointDetail() {
        return patrolPointDetailDao.findAllPatrolPointDetail();
    }
}
