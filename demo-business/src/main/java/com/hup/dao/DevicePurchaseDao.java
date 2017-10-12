package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
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

    int insertDevicePurchaseDetail(@Param("purchaseDetail") DevicePurchaseDetail devicePurchaseDetail);

    List<DevicePurchase> queryDevicePurchaseList(@Param("purchase") DevicePurchase purchase,
                                                 @Param("pager") Pager<DevicePurchase> pager);

    int getDevicePurchaseCount(@Param("device") DevicePurchase purchase);

    DevicePurchase findOne(Long id);

    List<DevicePurchaseDetail> findPurchaseDetailByCode(String purchaseCode);

    int updateDevicePurchase(@Param("devicePurchase") DevicePurchase devicePurchase);

    int deleteDevicePurchaseDetailByCode(String purchaseCode);

    int deleteDevicePurchase(Long id);

    List<DevicePurchase> getDevicePurchaseByStatus(String purchaseStatus);

    DevicePurchase findOneByCode(String purchaseCode);
}
