package com.hup.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-10
 * Time: 9:36
 */
public class DeviceScrap extends Device implements Serializable {

    private Long id;
    private String scrapCode;
    private String deviceCode;
    private String scrapReason;
    private Date scrapDate;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getScrapCode() {
        return scrapCode;
    }

    public void setScrapCode(String scrapCode) {
        this.scrapCode = scrapCode;
    }

    @Override
    public String getDeviceCode() {
        return deviceCode;
    }

    @Override
    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getScrapReason() {
        return scrapReason;
    }

    public void setScrapReason(String scrapReason) {
        this.scrapReason = scrapReason;
    }

    public Date getScrapDate() {
        return scrapDate;
    }

    public void setScrapDate(Date scrapDate) {
        this.scrapDate = scrapDate;
    }
}
