package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DeviceService;
import com.hup.dao.DeviceDao;
import com.hup.db.Pager;
import com.hup.entity.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 22:08
 */
@Service
public class DeviceServiceImpl implements DeviceService{

    @Autowired
    private DeviceDao deviceDao;

    @Override
    public int insert(Device device) {
        return deviceDao.insertDevice(device);
    }


    @Override
    public Pager<Device> queryDeviceList(Pager<Device> pager, Device device) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<Device> list = deviceDao.queryDeviceList(device, pager);
        int count = deviceDao.getDeviceCount(device);
        pager.setList(list);
        pager.setTotalCount(count);
        return pager;
    }


    @Override
    public Device findOne(Long id) {
        return deviceDao.findOne(id);
    }

    @Override
    public void update(Device device) {
        deviceDao.updateDevice(device);
    }

    @Override
    public void deleteDevice(Long id) {
        deviceDao.deleteDevice(id);
    }
}
