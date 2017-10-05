package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.dao.DevicePurchaseDao;
import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
import org.apache.commons.lang3.StringUtils;
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
public class DevicePurchaseServiceImpl implements DevicePurchaseService {

    @Autowired
    private DevicePurchaseDao devicePurchaseDao;


    @Override
    public Pager<DevicePurchase> queryDevicePurchaseList(Pager<DevicePurchase> pager, DevicePurchase device) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<DevicePurchase> purchaseList = devicePurchaseDao.queryDevicePurchaseList(device, pager);
        int purchaseCount = devicePurchaseDao.getDevicePurchaseCount(device);
        pager.setList(purchaseList);
        pager.setTotalCount(purchaseCount);
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
    public DevicePurchase insertDevicePurchase(DevicePurchase purchase) {
        purchase.setPurchaseStatus("创建完成");
        devicePurchaseDao.insertDevicePurchase(purchase);
        List<DevicePurchaseDetail> purchaseDetailList = purchase.getDevicePurchaseDetailList();
        for (DevicePurchaseDetail devicePurchaseDetail : purchaseDetailList){
            if (StringUtils.isNoneBlank(devicePurchaseDetail.getDeviceName())) {
                devicePurchaseDetail.setPurchaseCode(purchase.getPurchaseCode());
                devicePurchaseDao.insertDevicePurchaseDetail(devicePurchaseDetail);
            }
        }
        return purchase;
    }

    @Override
    public DevicePurchase findOne(Long id) {
        DevicePurchase devicePurchase = devicePurchaseDao.findOne(id);
         if (devicePurchase != null) {
            List<DevicePurchaseDetail> purchaseDetailByCode = devicePurchaseDao.findPurchaseDetailByCode(devicePurchase.getPurchaseCode());
            devicePurchase.setDevicePurchaseDetailList(purchaseDetailByCode);
        }
        return devicePurchase;
    }


    @Override
    public DevicePurchase updateDevicePurchase(DevicePurchase devicePurchase) {
        if (devicePurchaseDao.updateDevicePurchase(devicePurchase) > 0) {
            devicePurchaseDao.deleteDevicePurchaseDetailByCode(devicePurchase.getPurchaseCode());
            for (DevicePurchaseDetail devicePurchaseDetail : devicePurchase.getDevicePurchaseDetailList()){
                if (StringUtils.isNoneBlank(devicePurchaseDetail.getDeviceName())) {
                    devicePurchaseDetail.setPurchaseCode(devicePurchase.getPurchaseCode());
                    devicePurchaseDao.insertDevicePurchaseDetail(devicePurchaseDetail);
                }
            }
        }
        return devicePurchase;
    }


    @Override
    public int deleteDevicePurchase(Long id) {
        DevicePurchase one = devicePurchaseDao.findOne(id);
        if (one != null) {
            devicePurchaseDao.deleteDevicePurchase(id);
            devicePurchaseDao.deleteDevicePurchaseDetailByCode(one.getPurchaseCode());
        }
        return 1;
    }

}
