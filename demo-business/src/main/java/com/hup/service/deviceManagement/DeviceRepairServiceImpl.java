package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DeviceRepairService;
import com.hup.dao.DeviceRepairDao;
import com.hup.db.Pager;
import com.hup.entity.DeviceRepair;
import com.hup.entity.DeviceRepairDetail;
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
public class DeviceRepairServiceImpl implements DeviceRepairService {

    @Autowired
    private DeviceRepairDao deviceRepairDao;


    @Override
    public Pager<DeviceRepair> queryDeviceRepairList(Pager<DeviceRepair> pager, DeviceRepair device) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<DeviceRepair> RepairList = deviceRepairDao.queryDeviceRepairList(device, pager);
        int RepairCount = deviceRepairDao.getDeviceRepairCount(device);
        pager.setList(RepairList);
        pager.setTotalCount(RepairCount);
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
    public DeviceRepair insertDeviceRepair(DeviceRepair Repair) {
        deviceRepairDao.insertDeviceRepair(Repair);
        List<DeviceRepairDetail> RepairDetailList = Repair.getDeviceRepairDetailList();
        for (DeviceRepairDetail deviceRepairDetail : RepairDetailList){
            if (StringUtils.isNoneBlank(deviceRepairDetail.getDeviceCode())) {
                deviceRepairDetail.setRepairCode(Repair.getRepairCode());
                deviceRepairDao.insertDeviceRepairDetail(deviceRepairDetail);
            }
        }
        return Repair;
    }

    @Override
    public DeviceRepair findOne(Long id) {
        DeviceRepair deviceRepair = deviceRepairDao.findOne(id);
         if (deviceRepair != null) {
            List<DeviceRepairDetail> RepairDetailByCode = deviceRepairDao.findRepairDetailByCode(deviceRepair.getRepairCode());
            deviceRepair.setDeviceRepairDetailList(RepairDetailByCode);
        }
        return deviceRepair;
    }


    @Override
    public DeviceRepair updateDeviceRepair(DeviceRepair deviceRepair) {
        if (deviceRepairDao.updateDeviceRepair(deviceRepair) > 0) {
            deviceRepairDao.deleteDeviceRepairDetailByCode(deviceRepair.getRepairCode());
            for (DeviceRepairDetail deviceRepairDetail : deviceRepair.getDeviceRepairDetailList()){
                if (!deviceRepairDetail.getDeviceCode().equals("设备编号")) {
                    deviceRepairDetail.setRepairCode(deviceRepair.getRepairCode());
                    deviceRepairDao.insertDeviceRepairDetail(deviceRepairDetail);
                }
            }
        }
        return deviceRepair;
    }


    @Override
    public int deleteDeviceRepair(Long id) {
        DeviceRepair one = deviceRepairDao.findOne(id);
        if (one != null) {
            deviceRepairDao.deleteDeviceRepair(id);
            deviceRepairDao.deleteDeviceRepairDetailByCode(one.getRepairCode());
        }
        return 1;
    }

}
