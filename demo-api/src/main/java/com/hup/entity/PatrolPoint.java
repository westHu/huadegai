package com.hup.entity;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 巡检点
 * User: west_
 * Date: 2017-10-17
 * Time: 12:41
 */
public class PatrolPoint {

    private Long id;

    /** 相当于设备安装地点 */
    private String pointName; //

    private String pointDesc;

    /** //负责人 */
    private String pointAgent;

    /** X 坐标 */
    private String coordinateX;

    /** Y 坐标 */
    private String coordinateY;

    private Date createDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPointName() {
        return pointName;
    }

    public void setPointName(String pointName) {
        this.pointName = pointName;
    }

    public String getPointDesc() {
        return pointDesc;
    }

    public void setPointDesc(String pointDesc) {
        this.pointDesc = pointDesc;
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

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
