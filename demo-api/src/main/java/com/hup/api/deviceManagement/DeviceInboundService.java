package com.hup.api.deviceManagement;

import com.hup.db.Pager;
import com.hup.entity.DeviceInbound;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 9:23
 */
public interface DeviceInboundService {


    Pager<DeviceInbound> queryDeviceInboundList(Pager<DeviceInbound> pager, DeviceInbound inbound); //采购列表

    DeviceInbound insertDeviceInbound(DeviceInbound inbound);

    DeviceInbound findOne(Long id);

    DeviceInbound updateDeviceInbound(DeviceInbound deviceInbound);

    int deleteDeviceInbound(Long id);
}
