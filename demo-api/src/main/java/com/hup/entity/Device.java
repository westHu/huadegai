package com.hup.entity;

import com.hup.enums.DeviceEnum;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 14:03
 */
public class Device implements Serializable {
    private Long id;
    private String deviceCode; //设备编码
    private String deviceName; //设备名称
    private String deviceModel; //设备型号
    private String deviceSpec;  //设备规格
    private DeviceEnum.DeviceBgType deviceBgType; //设备大类
    private DeviceEnum.DeviceSmType deviceSmType; //设备小类
    private String energyType; //能源类型
    private String deviceImgUrls; //设备图片 多个；隔开

    private String deviceBrand; //设备品牌
    private String deviceVender; //设备厂家
    private String deviceValue;  //设备原值
    private String devicePrice; //设备价格
    private String deviceFunction; //设备用途

    private String deviceUnit; //设备隶属单位
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date devicePurchaserDate; //设备采购日期
    private String devicePurchaserAgent; //设备采购人
    private String installAddress; //安装地点
    private DeviceEnum.DeviceStatus deviceStatus; //未安装、已安装（待运行）、已运行、报修中、已报废

    private String remark; //其他未标出的属性
    private Date createDate;
    private Date updateDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDeviceCode() {
        return deviceCode;
    }

    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel;
    }

    public String getDeviceSpec() {
        return deviceSpec;
    }

    public void setDeviceSpec(String deviceSpec) {
        this.deviceSpec = deviceSpec;
    }

    public DeviceEnum.DeviceBgType getDeviceBgType() {
        return deviceBgType;
    }

    public void setDeviceBgType(DeviceEnum.DeviceBgType deviceBgType) {
        this.deviceBgType = deviceBgType;
    }

    public void setDeviceStatus(DeviceEnum.DeviceStatus deviceStatus) {
        this.deviceStatus = deviceStatus;
    }

    public String getEnergyType() {
        return energyType;
    }

    public void setEnergyType(String energyType) {
        this.energyType = energyType;
    }

    public DeviceEnum.DeviceSmType getDeviceSmType() {
        return deviceSmType;
    }

    public void setDeviceSmType(DeviceEnum.DeviceSmType deviceSmType) {
        this.deviceSmType = deviceSmType;
    }

    public String getDeviceBrand() {
        return deviceBrand;
    }

    public void setDeviceBrand(String deviceBrand) {
        this.deviceBrand = deviceBrand;
    }

    public String getDeviceVender() {
        return deviceVender;
    }

    public void setDeviceVender(String deviceVender) {
        this.deviceVender = deviceVender;
    }

    public String getDeviceValue() {
        return deviceValue;
    }

    public void setDeviceValue(String deviceValue) {
        this.deviceValue = deviceValue;
    }

    public String getDevicePrice() {
        return devicePrice;
    }

    public void setDevicePrice(String devicePrice) {
        this.devicePrice = devicePrice;
    }

    public String getDeviceFunction() {
        return deviceFunction;
    }

    public void setDeviceFunction(String deviceFunction) {
        this.deviceFunction = deviceFunction;
    }

    public String getDeviceUnit() {
        return deviceUnit;
    }

    public void setDeviceUnit(String deviceUnit) {
        this.deviceUnit = deviceUnit;
    }

    public Date getDevicePurchaserDate() {
        return devicePurchaserDate;
    }

    public void setDevicePurchaserDate(Date devicePurchaserDate) {
        this.devicePurchaserDate = devicePurchaserDate;
    }

    public String getDevicePurchaserAgent() {
        return devicePurchaserAgent;
    }

    public void setDevicePurchaserAgent(String devicePurchaserAgent) {
        this.devicePurchaserAgent = devicePurchaserAgent;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getInstallAddress() {
        return installAddress;
    }

    public void setInstallAddress(String installAddress) {
        this.installAddress = installAddress;
    }

    public DeviceEnum.DeviceStatus getDeviceStatus() {
        return deviceStatus;
    }

    public String getDeviceImgUrls() {
        return deviceImgUrls;
    }

    public void setDeviceImgUrls(String deviceImgUrls) {
        this.deviceImgUrls = deviceImgUrls;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
