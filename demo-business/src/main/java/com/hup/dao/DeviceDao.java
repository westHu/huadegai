package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.Device;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 22:09
 */
public interface DeviceDao {

    int insertDevice(@Param("device") Device device);

    List<Device> queryDeviceList(@Param("device") Device device, @Param("pager") Pager<Device> pager);

    int getDeviceCount(@Param("device") Device device);

    Device findOne(Long id);
}
