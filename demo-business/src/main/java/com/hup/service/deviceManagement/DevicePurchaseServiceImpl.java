package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.dao.DevicePurchaseDao;
import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
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
        List<DevicePurchase> list = new ArrayList<>();
        for (int i= 0; i<100; i++){
            DevicePurchase p = new DevicePurchase();
            p.setPurchaseCode("bianhao#" + i );
            p.setPurchaseName("PurchaseName#"+i);
            p.setPurchaseAgent("admin");
            p.setPaymentType("货到付款");
            p.setPurchaseDate(new Date());
            p.setRemark("采购备注");
            list.add(p);
        }
        pager.setList(list);
        pager.setPageCount(100);
        return pager;
    }


    @Override
    public DevicePurchase insertDevicePurchase(DevicePurchase purchase) {
        devicePurchaseDao.insertDevicePurchase(purchase);
        return purchase;
    }

    @Override
    public int insertDevicePurchaseList(List<DevicePurchaseDetail> purchaseDetailList) {
        return 0;
    }
}
