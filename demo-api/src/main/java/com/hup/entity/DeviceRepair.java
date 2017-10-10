package com.hup.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-02
 * Time: 22:37
 */
public class DeviceRepair implements Serializable {

    private Long id;
    private String repairCode; //维修单号
    private String repairName; //维修单名称;
    private String repairAgent; //维修负责人
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date repairDate; //维修时间
    private String repairCost; //维修费用
    private String repairRemark; //维修备注

    //=======非数据库字段
    private List<DeviceRepairDetail> deviceRepairDetailList; //明细列表


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRepairCode() {
        return repairCode;
    }

    public void setRepairCode(String repairCode) {
        this.repairCode = repairCode;
    }

    public String getRepairName() {
        return repairName;
    }

    public void setRepairName(String repairName) {
        this.repairName = repairName;
    }

    public String getRepairAgent() {
        return repairAgent;
    }

    public void setRepairAgent(String repairAgent) {
        this.repairAgent = repairAgent;
    }

    public Date getRepairDate() {
        return repairDate;
    }

    public void setRepairDate(Date repairDate) {
        this.repairDate = repairDate;
    }

    public String getRepairCost() {
        return repairCost;
    }

    public void setRepairCost(String repairCost) {
        this.repairCost = repairCost;
    }

    public String getRepairRemark() {
        return repairRemark;
    }

    public void setRepairRemark(String repairRemark) {
        this.repairRemark = repairRemark;
    }

    public List<DeviceRepairDetail> getDeviceRepairDetailList() {
        return deviceRepairDetailList;
    }

    public void setDeviceRepairDetailList(List<DeviceRepairDetail> deviceRepairDetailList) {
        this.deviceRepairDetailList = deviceRepairDetailList;
    }
}
