package com.hup.api.emergency;

import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyResourceDetail;
import com.hup.entity.emergency.EmergencyResourcePoint;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-24
 * Time: 23:38
 */
public interface EmergencyResourceDetailService {


    List<EmergencyResourceDetail> findResourceDetailByPointId(Long pointId);

    Pager<EmergencyResourceDetail> queryDetailListByPoint(EmergencyResourceDetail resourceDetail, Pager<EmergencyResourceDetail> pager);
}
