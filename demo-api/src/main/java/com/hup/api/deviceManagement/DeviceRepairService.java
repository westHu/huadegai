package com.hup.api.deviceManagement;

import com.hup.db.Pager;
import com.hup.entity.DeviceRepair;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 9:23
 */
public interface DeviceRepairService {


    Pager<DeviceRepair> queryDeviceRepairList(Pager<DeviceRepair> pager, DeviceRepair repair); //维修列表

    DeviceRepair insertDeviceRepair(DeviceRepair deviceRepair);

    DeviceRepair findOne(Long id);

    DeviceRepair updateDeviceRepair(DeviceRepair deviceRepair);

    int deleteDeviceRepair(Long id);
}
