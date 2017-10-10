package com.hup.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-02
 * Time: 22:47
 */
public class DeviceRepairDetail extends Device implements Serializable {

    private Long id;
    private String repairCode; //维修单号
    private String deviceCode; //设备编号
    private String repairReason; //故障原因
    private String repairContent; //维修内容
    private String repairNumber;//维修数量
    private String repairCost; //维修费用
    private Date repairDate; //维修时间
    private Date repairFinishDate;//维修完成时间
    private Date repairRemark;


    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getRepairCode() {
        return repairCode;
    }

    public void setRepairCode(String repairCode) {
        this.repairCode = repairCode;
    }

    @Override
    public String getDeviceCode() {
        return deviceCode;
    }

    @Override
    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getRepairReason() {
        return repairReason;
    }

    public void setRepairReason(String repairReason) {
        this.repairReason = repairReason;
    }

    public String getRepairContent() {
        return repairContent;
    }

    public void setRepairContent(String repairContent) {
        this.repairContent = repairContent;
    }

    public String getRepairNumber() {
        return repairNumber;
    }

    public void setRepairNumber(String repairNumber) {
        this.repairNumber = repairNumber;
    }

    public String getRepairCost() {
        return repairCost;
    }

    public void setRepairCost(String repairCost) {
        this.repairCost = repairCost;
    }

    public Date getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(Date repairDate) {
        this.repairDate = repairDate;
    }

    public Date getRepairFinishDate() {
        return repairFinishDate;
    }

    public void setRepairFinishDate(Date repairFinishDate) {
        this.repairFinishDate = repairFinishDate;
    }

    public Date getRepairRemark() {
        return repairRemark;
    }

    public void setRepairRemark(Date repairRemark) {
        this.repairRemark = repairRemark;
    }
}
