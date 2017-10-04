package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.DeviceInbound;
import com.hup.entity.DeviceInbound;
import com.hup.entity.DeviceInboundDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 10:04
 */
public interface DeviceInboundDao {

    int insertDeviceInbound(@Param("inbound") DeviceInbound inbound);

    int insertDeviceInboundDetail(@Param("inboundDetail") DeviceInboundDetail deviceInboundDetail);

    List<DeviceInbound> queryDeviceInboundList(@Param("inbound") DeviceInbound inbound,
                                               @Param("pager") Pager<DeviceInbound> pager);

    int getDeviceInboundCount(@Param("inbound") DeviceInbound inbound);

    DeviceInbound findOne(Long id);

    List<DeviceInboundDetail> findInboundDetailByCode(String inboundCode);

    int updateDeviceInbound(@Param("deviceInbound") DeviceInbound deviceInbound);

    int deleteDeviceInboundDetailByCode(String inboundCode);

    int deleteDeviceInbound(Long id);
}
