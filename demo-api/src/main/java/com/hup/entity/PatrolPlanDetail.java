package com.hup.entity;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 巡检计划
 * User: west_
 * Date: 2017-10-17
 * Time: 20:42
 */
public class PatrolPlanDetail {

    private Long id;
    private Long planId;
    private Long pointId;
    private String deviceCode;
    private String tags;
    private Date createDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getPlanId() {
        return planId;
    }

    public void setPlanId(Long planId) {
        this.planId = planId;
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

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }


    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
