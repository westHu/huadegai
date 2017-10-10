package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DeviceScrapService;
import com.hup.dao.DeviceScrapDao;
import com.hup.db.Pager;
import com.hup.entity.DeviceScrap;
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
public class DeviceScrapServiceImpl implements DeviceScrapService {

    @Autowired
    private DeviceScrapDao deviceScrapDao;


    @Override
    public Pager<DeviceScrap> queryDeviceScrapList(Pager<DeviceScrap> pager, DeviceScrap device) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<DeviceScrap> ScrapList = deviceScrapDao.queryDeviceScrapList(device, pager);
        int ScrapCount = deviceScrapDao.getDeviceScrapCount(device);
        pager.setList(ScrapList);
        pager.setTotalCount(ScrapCount);
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
    public DeviceScrap insertDeviceScrap(DeviceScrap scrap) {
        deviceScrapDao.insertDeviceScrap(scrap);
        return scrap;
    }

    @Override
    public DeviceScrap findOne(Long id) {
        DeviceScrap deviceScrap = deviceScrapDao.findOne(id);
        return deviceScrap;
    }


    @Override
    public DeviceScrap updateDeviceScrap(DeviceScrap deviceScrap) {
        if (deviceScrapDao.updateDeviceScrap(deviceScrap) > 0) {
            deviceScrapDao.deleteDeviceScrapDetailByCode(deviceScrap.getScrapCode());
        }
        return deviceScrap;
    }


    @Override
    public int deleteDeviceScrap(Long id) {
        DeviceScrap one = deviceScrapDao.findOne(id);
        if (one != null) {
            deviceScrapDao.deleteDeviceScrap(id);
            deviceScrapDao.deleteDeviceScrapDetailByCode(one.getScrapCode());
        }
        return 1;
    }

}
