package com.hup.entity.emergency;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 应急物资仓库，存放点
 * User: west_
 * Date: 2017-10-24
 * Time: 23:15
 */
public class EmergencyAlarmEvent {

    private Long id;
    private String name;
    private String desc;
    private String type;
    private String degree;
    private String alarmCause;
    private String location;
    private Integer influenceRange;
    private String coordinateX;
    private String coordinateY;
    private String reporter;
    private Date reportDate;
    private String creater;
    private String status;
    private Date createDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getAlarmCause() {
        return alarmCause;
    }

    public void setAlarmCause(String alarmCause) {
        this.alarmCause = alarmCause;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Integer getInfluenceRange() {
        return influenceRange;
    }

    public void setInfluenceRange(Integer influenceRange) {
        this.influenceRange = influenceRange;
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

    public String getReporter() {
        return reporter;
    }

    public void setReporter(String reporter) {
        this.reporter = reporter;
    }

    public Date getReportDate() {
        return reportDate;
    }

    public void setReportDate(Date reportDate) {
        this.reportDate = reportDate;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
