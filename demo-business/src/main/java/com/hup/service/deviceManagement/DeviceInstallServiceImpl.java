package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DeviceInstallService;
import com.hup.dao.DeviceInstallDao;
import com.hup.db.Pager;
import com.hup.entity.DeviceInstall;
import com.hup.entity.DeviceInstallDetail;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 9:25
 */
@Service
public class DeviceInstallServiceImpl implements DeviceInstallService {

    @Autowired
    private DeviceInstallDao deviceInstallDao;


    @Override
    public Pager<DeviceInstall> queryDeviceInstallList(Pager<DeviceInstall> pager, DeviceInstall device) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<DeviceInstall> InstallList = deviceInstallDao.queryDeviceInstallList(device, pager);
        int InstallCount = deviceInstallDao.getDeviceInstallCount(device);
        pager.setList(InstallList);
        pager.setTotalCount(InstallCount);
        return pager;
    }


    /**
     * <p>@Description:  保存采购单 和 采购单明细
     * <p>@Author: hupj
     * <p>@Date: 2017/10/4
     * <p>@Param:
     * <p>@return:
     */
    @Override
    public DeviceInstall insertDeviceInstall(DeviceInstall Install) {
        deviceInstallDao.insertDeviceInstall(Install);
        List<DeviceInstallDetail> InstallDetailList = Install.getDeviceInstallDetailList();
        for (DeviceInstallDetail deviceInstallDetail : InstallDetailList){
            if (StringUtils.isNoneBlank(deviceInstallDetail.getDeviceCode())) {
                deviceInstallDetail.setInstallCode(Install.getInstallCode());
                deviceInstallDao.insertDeviceInstallDetail(deviceInstallDetail);
            }
        }
        return Install;
    }

    @Override
    public DeviceInstall findOne(Long id) {
        DeviceInstall deviceInstall = deviceInstallDao.findOne(id);
         if (deviceInstall != null) {
            List<DeviceInstallDetail> InstallDetailByCode = deviceInstallDao.findInstallDetailByCode(deviceInstall.getInstallCode());
            deviceInstall.setDeviceInstallDetailList(InstallDetailByCode);
        }
        return deviceInstall;
    }


    @Override
    public DeviceInstall updateDeviceInstall(DeviceInstall deviceInstall) {
        if (deviceInstallDao.updateDeviceInstall(deviceInstall) > 0) {
            deviceInstallDao.deleteDeviceInstallDetailByCode(deviceInstall.getInstallCode());
            for (DeviceInstallDetail deviceInstallDetail : deviceInstall.getDeviceInstallDetailList()){
                if (!deviceInstallDetail.getDeviceCode().equals("设备编号")) {
                    deviceInstallDetail.setInstallCode(deviceInstall.getInstallCode());
                    deviceInstallDao.insertDeviceInstallDetail(deviceInstallDetail);
                }
            }
        }
        return deviceInstall;
    }


    @Override
    public int deleteDeviceInstall(Long id) {
        DeviceInstall one = deviceInstallDao.findOne(id);
        if (one != null) {
            deviceInstallDao.deleteDeviceInstall(id);
            deviceInstallDao.deleteDeviceInstallDetailByCode(one.getInstallCode());
        }
        return 1;
    }

}
