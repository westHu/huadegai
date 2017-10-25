package com.hup.dao;

import com.hup.entity.emergency.EmergencyResourcePoint;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-24
 * Time: 23:41
 */
public interface EmergencyMaterialPointDao {

    List<EmergencyResourcePoint> getAll();

    List<EmergencyResourcePoint> findPointByType(String type);
}
