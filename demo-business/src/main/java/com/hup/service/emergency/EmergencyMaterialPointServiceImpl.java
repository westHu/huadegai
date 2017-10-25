package com.hup.service.emergency;

import com.hup.api.emergency.EmergencyMaterialPointService;
import com.hup.dao.EmergencyMaterialPointDao;
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
public class EmergencyMaterialPointServiceImpl implements EmergencyMaterialPointService{

    @Autowired
    private EmergencyMaterialPointDao emergencyMaterialPointDao;


    @Override
    public List<EmergencyResourcePoint> getAll() {
        return emergencyMaterialPointDao.getAll();
    }

    @Override
    public List<EmergencyResourcePoint> findPointByType(String type) {
        return emergencyMaterialPointDao.findPointByType(type);
    }
}
