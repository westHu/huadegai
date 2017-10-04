package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DeviceInboundService;
import com.hup.api.deviceManagement.DeviceInboundService;
import com.hup.dao.DeviceInboundDao;
import com.hup.dao.DeviceInboundDao;
import com.hup.db.Pager;
import com.hup.entity.DeviceInbound;
import com.hup.entity.DeviceInboundDetail;
import com.hup.entity.DeviceInbound;
import com.hup.entity.DeviceInboundDetail;
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
public class DeviceInboundServiceImpl implements DeviceInboundService {

    @Autowired
    private DeviceInboundDao deviceInboundDao;


    @Override
    public Pager<DeviceInbound> queryDeviceInboundList(Pager<DeviceInbound> pager, DeviceInbound device) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<DeviceInbound> inboundList = deviceInboundDao.queryDeviceInboundList(device, pager);
        int inboundCount = deviceInboundDao.getDeviceInboundCount(device);
        pager.setList(inboundList);
        pager.setTotalCount(inboundCount);
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
    public DeviceInbound insertDeviceInbound(DeviceInbound inbound) {
        deviceInboundDao.insertDeviceInbound(inbound);
        List<DeviceInboundDetail> inboundDetailList = inbound.getDeviceInboundDetailList();
        for (DeviceInboundDetail deviceInboundDetail : inboundDetailList){
            if (!deviceInboundDetail.getDeviceCode().equals("设备编号")) {
                deviceInboundDetail.setInboundCode(inbound.getInboundCode());
                deviceInboundDao.insertDeviceInboundDetail(deviceInboundDetail);
            }
        }
        return inbound;
    }

    @Override
    public DeviceInbound findOne(Long id) {
        DeviceInbound deviceInbound = deviceInboundDao.findOne(id);
         if (deviceInbound != null) {
            List<DeviceInboundDetail> inboundDetailByCode = deviceInboundDao.findInboundDetailByCode(deviceInbound.getInboundCode());
            deviceInbound.setDeviceInboundDetailList(inboundDetailByCode);
        }
        return deviceInbound;
    }


    @Override
    public DeviceInbound updateDeviceInbound(DeviceInbound deviceInbound) {
        if (deviceInboundDao.updateDeviceInbound(deviceInbound) > 0) {
            deviceInboundDao.deleteDeviceInboundDetailByCode(deviceInbound.getInboundCode());
            for (DeviceInboundDetail deviceInboundDetail : deviceInbound.getDeviceInboundDetailList()){
                if (!deviceInboundDetail.getDeviceCode().equals("设备编号")) {
                    deviceInboundDetail.setInboundCode(deviceInbound.getInboundCode());
                    deviceInboundDao.insertDeviceInboundDetail(deviceInboundDetail);
                }
            }
        }
        return deviceInbound;
    }


    @Override
    public int deleteDeviceInbound(Long id) {
        DeviceInbound one = deviceInboundDao.findOne(id);
        if (one != null) {
            deviceInboundDao.deleteDeviceInbound(id);
            deviceInboundDao.deleteDeviceInboundDetailByCode(one.getInboundCode());
        }
        return 1;
    }

}
