package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.DeviceRepair;
import com.hup.entity.DeviceRepairDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 10:04
 */
public interface DeviceRepairDao {

    int insertDeviceRepair(@Param("install") DeviceRepair repair);

    int insertDeviceRepairDetail(@Param("installDetail") DeviceRepairDetail deviceRepairDetail);

    List<DeviceRepair> queryDeviceRepairList(@Param("install") DeviceRepair repair,
                                               @Param("pager") Pager<DeviceRepair> pager);

    int getDeviceRepairCount(@Param("install") DeviceRepair repair);

    DeviceRepair findOne(Long id);

    List<DeviceRepairDetail> findRepairDetailByCode(String repairCode);

    int updateDeviceRepair(@Param("deviceRepair") DeviceRepair deviceRepair);

    int deleteDeviceRepairDetailByCode(String repairCode);

    int deleteDeviceRepair(Long id);
}
