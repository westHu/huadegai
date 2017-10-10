package com.hup.api.deviceManagement;

import com.hup.db.Pager;
import com.hup.entity.DeviceScrap;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 9:23
 */
public interface DeviceScrapService {


    Pager<DeviceScrap> queryDeviceScrapList(Pager<DeviceScrap> pager, DeviceScrap deviceScrap); //报废列表

    DeviceScrap insertDeviceScrap(DeviceScrap deviceScrap);

    DeviceScrap findOne(Long id);

    DeviceScrap updateDeviceScrap(DeviceScrap deviceScrap);

    int deleteDeviceScrap(Long id);
}
