package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DeviceService;
import com.hup.dao.deviceManagement.DeviceDao;
import com.hup.entity.deviceManagement.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
