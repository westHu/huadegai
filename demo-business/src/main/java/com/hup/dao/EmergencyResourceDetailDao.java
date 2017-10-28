package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyResourceDetail;
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
public interface EmergencyResourceDetailDao {

    List<EmergencyResourceDetail> findResourceDetailByPointId(Long pointId);

    List<EmergencyResourceDetail> queryDetailListByPoint(@Param("resourceDetail") EmergencyResourceDetail resourceDetail, @Param("pager") Pager<EmergencyResourceDetail> pager);

    int getDetailListByPointCount(@Param("resourceDetail") EmergencyResourceDetail resourceDetail);
}
