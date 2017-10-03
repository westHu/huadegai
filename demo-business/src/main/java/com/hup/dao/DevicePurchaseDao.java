package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 10:04
 */
public interface DevicePurchaseDao {

    int insertDevicePurchase(@Param("purchase") DevicePurchase purchase);

    List<DevicePurchase> queryDevicePurchaseList(@Param("purchase") DevicePurchase purchase,
                                                 @Param("pager") Pager<DevicePurchase> pager);

    int getDevicePurchaseCount(@Param("device") DevicePurchase purchase);

    DevicePurchase findOne(Long id);
}
