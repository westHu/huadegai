package com.hup.api.deviceManagement;

import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
import com.hup.entity.ProcessRuntime;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 9:23
 */
public interface DevicePurchaseService {


    Pager<DevicePurchase> queryDevicePurchaseList(Pager<DevicePurchase> pager, DevicePurchase device); //采购列表

    DevicePurchase insertDevicePurchase(DevicePurchase purchase);

    DevicePurchase findOne(Long id);

    DevicePurchase updateDevicePurchase(DevicePurchase devicePurchase);

    int deleteDevicePurchase(Long id);

    List<DevicePurchase> getDevicePurchaseByStatus(String purchaseStatus);

    DevicePurchase findOneByCode(String purchaseCode);

    Boolean auditProcess(String code, ProcessRuntime processRuntime);
}
