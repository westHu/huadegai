package com.hup.entity;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 巡检点
 * User: west_
 * Date: 2017-10-17
 * Time: 12:41
 */
public class PatrolPointDetail {

    private Long id;

    private Long pointId;

    private String deviceCode;

    private String patrolNotice;

    private Date createDate;

    //==----非数据库字段
    private String pointAgent;  //坐标
    private String coordinateX;
    private String coordinateY;

    private String deviceName;      //设备名称
    private String deviceCategory; // 设备分类
    private String deviceModel;     //设备型号
    private String deviceSpec;      //设备规格
    private String deviceBrand;     //设备品牌




    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPointId() {
        return pointId;
    }

    public void setPointId(Long pointId) {
        this.pointId = pointId;
    }

    public String getDeviceCode() {
        return deviceCode;
    }

    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getPatrolNotice() {
        return patrolNotice;
    }

    public void setPatrolNotice(String patrolNotice) {
        this.patrolNotice = patrolNotice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }


    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceCategory() {
        return deviceCategory;
    }

    public void setDeviceCategory(String deviceCategory) {
        this.deviceCategory = deviceCategory;
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

    public String getDeviceBrand() {
        return deviceBrand;
    }

    public void setDeviceBrand(String deviceBrand) {
        this.deviceBrand = deviceBrand;
    }

    public String getPointAgent() {
        return pointAgent;
    }

    public void setPointAgent(String pointAgent) {
        this.pointAgent = pointAgent;
    }

    public String getCoordinateX() {
        return coordinateX;
    }

    public void setCoordinateX(String coordinateX) {
        this.coordinateX = coordinateX;
    }

    public String getCoordinateY() {
        return coordinateY;
    }

    public void setCoordinateY(String coordinateY) {
        this.coordinateY = coordinateY;
    }
}
