package com.hup.entity;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 设备安装单
 * User: west_
 * Date: 2017-10-09
 * Time: 19:09
 */
public class DeviceInstall {

    private Long id;
    private String installCode; //安装单编码
    private String installName; //安装单名称
    private String installPerson; //安装人员
    private String installUnit; //安装单位 或者外部安装公司
    private String installCost;
    private String installRemark; //安装备注
    private Date installDate; //安装时间
    private Date createDate;

    //================================
    private List<DeviceInstallDetail> deviceInstallDetailList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInstallCode() {
        return installCode;
    }

    public void setInstallCode(String installCode) {
        this.installCode = installCode;
    }

    public String getInstallName() {
        return installName;
    }

    public void setInstallName(String installName) {
        this.installName = installName;
    }

    public String getInstallPerson() {
        return installPerson;
    }

    public void setInstallPerson(String installPerson) {
        this.installPerson = installPerson;
    }

    public String getInstallCost() {
        return installCost;
    }

    public void setInstallCost(String installCost) {
        this.installCost = installCost;
    }

    public String getInstallUnit() {
        return installUnit;
    }

    public void setInstallUnit(String installUnit) {
        this.installUnit = installUnit;
    }

    public String getInstallRemark() {
        return installRemark;
    }

    public void setInstallRemark(String installRemark) {
        this.installRemark = installRemark;
    }

    public Date getInstallDate() {
        return installDate;
    }

    public void setInstallDate(Date installDate) {
        this.installDate = installDate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public List<DeviceInstallDetail> getDeviceInstallDetailList() {
        return deviceInstallDetailList;
    }

    public void setDeviceInstallDetailList(List<DeviceInstallDetail> deviceInstallDetailList) {
        this.deviceInstallDetailList = deviceInstallDetailList;
    }
}
