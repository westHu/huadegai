package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.DeviceInstall;
import com.hup.entity.DeviceInstallDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 10:04
 */
public interface DeviceInstallDao {

    int insertDeviceInstall(@Param("install") DeviceInstall Install);

    int insertDeviceInstallDetail(@Param("installDetail") DeviceInstallDetail deviceInstallDetail);

    List<DeviceInstall> queryDeviceInstallList(@Param("install") DeviceInstall Install,
                                               @Param("pager") Pager<DeviceInstall> pager);

    int getDeviceInstallCount(@Param("install") DeviceInstall Install);

    DeviceInstall findOne(Long id);

    List<DeviceInstallDetail> findInstallDetailByCode(String InstallCode);

    int updateDeviceInstall(@Param("deviceInstall") DeviceInstall deviceInstall);

    int deleteDeviceInstallDetailByCode(String InstallCode);

    int deleteDeviceInstall(Long id);
}
