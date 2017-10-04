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
public class DeviceInbound implements Serializable {

    private Long id;
    private String inboundCode; //入库单号
    private String inboundName; //入库单名称;
    private String inboundAgent; //入库人员
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date inboundDate; //入库时间
    private String inboundRemark; //入库备注

    //=======非数据库字段
    private List<DeviceInboundDetail> deviceInboundDetailList; //明细列表


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInboundCode() {
        return inboundCode;
    }

    public void setInboundCode(String inboundCode) {
        this.inboundCode = inboundCode;
    }

    public String getInboundName() {
        return inboundName;
    }

    public void setInboundName(String inboundName) {
        this.inboundName = inboundName;
    }

    public String getInboundAgent() {
        return inboundAgent;
    }

    public void setInboundAgent(String inboundAgent) {
        this.inboundAgent = inboundAgent;
    }

    public Date getInboundDate() {
        return inboundDate;
    }

    public void setInboundDate(Date inboundDate) {
        this.inboundDate = inboundDate;
    }

    public String getInboundRemark() {
        return inboundRemark;
    }

    public void setInboundRemark(String inboundRemark) {
        this.inboundRemark = inboundRemark;
    }

    public List<DeviceInboundDetail> getDeviceInboundDetailList() {
        return deviceInboundDetailList;
    }

    public void setDeviceInboundDetailList(List<DeviceInboundDetail> deviceInboundDetailList) {
        this.deviceInboundDetailList = deviceInboundDetailList;
    }
}
