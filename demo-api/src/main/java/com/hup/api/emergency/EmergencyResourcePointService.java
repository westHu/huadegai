package com.hup.api.emergency;

import com.hup.entity.emergency.EmergencyResourcePoint;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-24
 * Time: 23:38
 */
public interface EmergencyResourcePointService {

    List<EmergencyResourcePoint> getAll();

    List<EmergencyResourcePoint> findPointByType(String type);
}
