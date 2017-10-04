package com.hup.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-02
 * Time: 22:47
 */
public class DeviceInboundDetail extends Device implements Serializable {

    private Long id;
    private String inboundCode; //入库单号
    private Integer inboundNumber;//入库数量
    private String inboundLocation; //入库位置
    private Date inboundDate; //入库时间


    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getInboundCode() {
        return inboundCode;
    }

    public void setInboundCode(String inboundCode) {
        this.inboundCode = inboundCode;
    }

    public Integer getInboundNumber() {
        return inboundNumber;
    }

    public void setInboundNumber(Integer inboundNumber) {
        this.inboundNumber = inboundNumber;
    }

    public String getInboundLocation() {
        return inboundLocation;
    }

    public void setInboundLocation(String inboundLocation) {
        this.inboundLocation = inboundLocation;
    }

    public Date getInboundDate() {
        return inboundDate;
    }

    public void setInboundDate(Date inboundDate) {
        this.inboundDate = inboundDate;
    }
}
