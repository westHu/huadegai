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
    /** 设备固有属性 */
    private Long id;
    private String deviceCode;      //设备编码
    private DeviceEnum.DeviceBgType deviceBgType; //设备大类
    private DeviceEnum.DeviceSmType deviceSmType; //设备小类
    private String deviceName;      //设备名称
    private String deviceModel;     //设备型号
    private String deviceSpec;      //设备规格
    private String deviceBrand;     //设备品牌
    private String deviceManufacturer;    //设备厂家 制造商
    private String deviceValue;     //设备原值
    private String deviceFunction;  //设备用途
    private String deviceImgUrls;   //设备图片 多个；隔开
    private String remark;          //其他未标出的属性
    private DeviceEnum.DeviceStatus deviceStatus; //未安装、已安装（待运行）、已运行、报修中、已报废

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

    public String getDeviceManufacturer() {
        return deviceManufacturer;
    }

    public void setDeviceManufacturer(String deviceManufacturer) {
        this.deviceManufacturer = deviceManufacturer;
    }

    public String getDeviceValue() {
        return deviceValue;
    }

    public void setDeviceValue(String deviceValue) {
        this.deviceValue = deviceValue;
    }

    public String getDeviceFunction() {
        return deviceFunction;
    }

    public void setDeviceFunction(String deviceFunction) {
        this.deviceFunction = deviceFunction;
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

    public DeviceEnum.DeviceStatus getDeviceStatus() {
        return deviceStatus;
    }

    public void setDeviceStatus(DeviceEnum.DeviceStatus deviceStatus) {
        this.deviceStatus = deviceStatus;
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
}
