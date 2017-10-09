package com.hup.api.deviceManagement;

import com.hup.db.Pager;
import com.hup.entity.DeviceInstall;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 9:23
 */
public interface DeviceInstallService {


    Pager<DeviceInstall> queryDeviceInstallList(Pager<DeviceInstall> pager, DeviceInstall Install); //安装列表

    DeviceInstall insertDeviceInstall(DeviceInstall Install);

    DeviceInstall findOne(Long id);

    DeviceInstall updateDeviceInstall(DeviceInstall deviceInstall);

    int deleteDeviceInstall(Long id);
}
