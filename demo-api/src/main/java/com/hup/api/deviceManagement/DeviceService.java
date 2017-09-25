package com.hup.api.deviceManagement;

import com.hup.db.Pager;
import com.hup.entity.Device;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 22:10
 */
public interface DeviceService {

    int insert(Device device);

    Pager<Device> queryDeviceList(Pager<Device> pager, Device device); //查询发送短信列表

    Device findOne(Long id);
}
