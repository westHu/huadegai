package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyResourcePoint;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-24
 * Time: 23:41
 */
public interface EmergencyResourcePointDao {

    List<EmergencyResourcePoint> getAll();

    List<EmergencyResourcePoint> findPointByType(String type);

    List<EmergencyResourcePoint> findPointListByType(@Param("types") String[] types);

    List<EmergencyResourcePoint> queryPointListByType(@Param("resourcePoint") EmergencyResourcePoint resourcePoint, @Param("pager") Pager<EmergencyResourcePoint> pager);

    int getPointListByTypeCount(@Param("resourcePoint") EmergencyResourcePoint resourcePoint);

}
