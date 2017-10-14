package com.hup.service.deviceManagement;

import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.api.flow.ProcessRuntimeService;
import com.hup.dao.DevicePurchaseDao;
import com.hup.dao.ProcessDefinitionDao;
import com.hup.dao.ProcessRuntimeDao;
import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
import com.hup.entity.ProcessDefinition;
import com.hup.entity.ProcessRuntime;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
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

    @Autowired
    private ProcessDefinitionDao processDefinitionDao;

    @Autowired
    private ProcessRuntimeService processRuntimeService;


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


    @Override
    public List<DevicePurchase> getDevicePurchaseByStatus(String purchaseStatus) {
        List<DevicePurchase> purchaseList = devicePurchaseDao.getDevicePurchaseByStatus(purchaseStatus);
        for (DevicePurchase devicePurchase : purchaseList){
            List<DevicePurchaseDetail> detailList = devicePurchaseDao.findPurchaseDetailByCode(devicePurchase.getPurchaseCode());
            devicePurchase.setDevicePurchaseDetailList(detailList);
        }
        return purchaseList;
    }

    @Override
    public DevicePurchase findOneByCode(String purchaseCode) {
        DevicePurchase devicePurchase = devicePurchaseDao.findOneByCode(purchaseCode);
        if (null != devicePurchase) {
            List<DevicePurchaseDetail> detailList = devicePurchaseDao.findPurchaseDetailByCode(devicePurchase.getPurchaseCode());
            devicePurchase.setDevicePurchaseDetailList(detailList);
        }
        return devicePurchase;
    }


    @Override
    public Boolean auditProcess(Long id, ProcessRuntime processRuntime) {
        DevicePurchase devicePurchase = devicePurchaseDao.findOne(id);
        if (null == devicePurchase) return Boolean.FALSE;

        //1,插入创建记录---
        ProcessDefinition definition = processDefinitionDao.findDefinitionByNameAndStep(processRuntime.getName(), processRuntime.getStep());
        if (null == definition) return Boolean.FALSE;

        ProcessRuntime createRuntime = new ProcessRuntime();
        BeanUtils.copyProperties(definition, createRuntime);
        createRuntime.setCode(devicePurchase.getPurchaseCode()); //业务关联编号
        createRuntime.setMembers(devicePurchase.getPurchaseAgent()); //采购单的创建人
        createRuntime.setReceipted(devicePurchase.getPurchaseAgent()); //已签收人
        createRuntime.setExecuted(devicePurchase.getPurchaseAgent()); //已执行人
        createRuntime.setComment(devicePurchase.getPurchaseAgent() + "创建了该流程，并且提交了审核。");
        processRuntimeService.insertProcessRuntime(createRuntime, Boolean.FALSE); //不需要创建task

        definition = processDefinitionDao.findDefinitionByNameAndStep(processRuntime.getName(), processRuntime.getStep()+ 1);
        if (null == definition) return Boolean.FALSE;
        BeanUtils.copyProperties(definition, processRuntime);
        if (StringUtils.isBlank(devicePurchase.getPurchaseAuditors())){
            processRuntime.setMembers(definition.getMembers());
            processRuntime.setGroups(definition.getGroups());
        }else {
            processRuntime.setMembers(devicePurchase.getPurchaseAuditors());
        }
        processRuntimeService.insertProcessRuntime(processRuntime, Boolean.TRUE); //需要创建task

        //devicePurchase.setPurchaseStatus("审核中");
        devicePurchase.setPurchaseStatus(definition.getStepDesc());
        devicePurchaseDao.updateDevicePurchase(devicePurchase);
        return null;
    }

}
