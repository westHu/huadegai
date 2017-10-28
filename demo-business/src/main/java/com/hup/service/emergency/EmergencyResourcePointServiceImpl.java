package com.hup.service.emergency;

import com.hup.api.emergency.EmergencyResourcePointService;
import com.hup.dao.EmergencyResourcePointDao;
import com.hup.db.Pager;
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
public class EmergencyResourcePointServiceImpl implements EmergencyResourcePointService {

    @Autowired
    private EmergencyResourcePointDao emergencyResourcePointDao;


    @Override
    public List<EmergencyResourcePoint> getAll() {
        return emergencyResourcePointDao.getAll();
    }

    @Override
    public List<EmergencyResourcePoint> findPointByType(String type) {
        return emergencyResourcePointDao.findPointByType(type);
    }

    @Override
    public List<EmergencyResourcePoint> findPointListByType(String[] types) {
        return emergencyResourcePointDao.findPointListByType(types);
    }

    @Override
    public Pager<EmergencyResourcePoint> queryPointListByType(EmergencyResourcePoint resourcePoint, Pager<EmergencyResourcePoint> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<EmergencyResourcePoint> pointList = emergencyResourcePointDao.queryPointListByType(resourcePoint, pager);
        int pointCount = emergencyResourcePointDao.getPointListByTypeCount(resourcePoint);
        pager.setList(pointList);
        pager.setTotalCount(pointCount);
        return pager;

    }
}
