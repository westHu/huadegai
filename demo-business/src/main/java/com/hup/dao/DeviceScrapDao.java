package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.DeviceScrap;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 10:04
 */
public interface DeviceScrapDao {

    int insertDeviceScrap(@Param("install") DeviceScrap scrap);

    List<DeviceScrap> queryDeviceScrapList(@Param("install") DeviceScrap scrap,
                                             @Param("pager") Pager<DeviceScrap> pager);

    int getDeviceScrapCount(@Param("install") DeviceScrap scrap);

    DeviceScrap findOne(Long id);

    int updateDeviceScrap(@Param("deviceScrap") DeviceScrap deviceScrap);

    int deleteDeviceScrapDetailByCode(String scrapCode);

    int deleteDeviceScrap(Long id);
}
