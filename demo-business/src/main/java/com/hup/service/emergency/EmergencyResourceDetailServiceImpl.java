package com.hup.service.emergency;

import com.hup.api.emergency.EmergencyResourceDetailService;
import com.hup.api.emergency.EmergencyResourcePointService;
import com.hup.dao.EmergencyResourceDetailDao;
import com.hup.dao.EmergencyResourcePointDao;
import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyResourceDetail;
import com.hup.entity.emergency.EmergencyResourcePoint;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-24
 * Time: 23:39
 */
@Service
public class EmergencyResourceDetailServiceImpl implements EmergencyResourceDetailService {

    @Autowired
    private EmergencyResourceDetailDao resourceDetailDao;

    @Override
    public List<EmergencyResourceDetail> findResourceDetailByPointId(Long pointId) {
        return resourceDetailDao.findResourceDetailByPointId(pointId);
    }

    @Override
    public Pager<EmergencyResourceDetail> queryDetailListByPoint(EmergencyResourceDetail resourceDetail, Pager<EmergencyResourceDetail> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<EmergencyResourceDetail> detailList = resourceDetailDao.queryDetailListByPoint(resourceDetail, pager);
        int detailCount = resourceDetailDao.getDetailListByPointCount(resourceDetail);
        pager.setList(detailList);
        pager.setTotalCount(detailCount);
        return pager;
    }
}
