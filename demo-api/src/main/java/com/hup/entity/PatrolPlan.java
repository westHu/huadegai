package com.hup.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.text.DateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 巡检计划
 * User: west_
 * Date: 2017-10-17
 * Time: 20:42
 */
public class PatrolPlan {

    private Long id;
    private String planName; //名称
    private String planDesc; //描述
    private String planCreater; //创建者
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date planBegin; //起止时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date planEnd; //起止时间
    private Integer planPerDay; //时间间隔 天
    private Integer planPerHour; //时间间隔 小时
    private String planRemark; //备注
    private String pointIds; //关联的巡检点
    private Boolean status;
    private Date createDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public String getPlanDesc() {
        return planDesc;
    }

    public void setPlanDesc(String planDesc) {
        this.planDesc = planDesc;
    }

    public String getPlanCreater() {
        return planCreater;
    }

    public void setPlanCreater(String planCreater) {
        this.planCreater = planCreater;
    }

    public Date getPlanBegin() {
        return planBegin;
    }

    public void setPlanBegin(Date planBegin) {
        this.planBegin = planBegin;
    }

    public Date getPlanEnd() {
        return planEnd;
    }

    public void setPlanEnd(Date planEnd) {
        this.planEnd = planEnd;
    }

    public Integer getPlanPerDay() {
        return planPerDay;
    }

    public void setPlanPerDay(Integer planPerDay) {
        this.planPerDay = planPerDay;
    }

    public Integer getPlanPerHour() {
        return planPerHour;
    }

    public void setPlanPerHour(Integer planPerHour) {
        this.planPerHour = planPerHour;
    }

    public String getPlanRemark() {
        return planRemark;
    }

    public void setPlanRemark(String planRemark) {
        this.planRemark = planRemark;
    }

    public String getPointIds() {
        return pointIds;
    }

    public void setPointIds(String pointIds) {
        this.pointIds = pointIds;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
