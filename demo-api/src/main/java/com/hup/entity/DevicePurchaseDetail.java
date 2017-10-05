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
public class DevicePurchaseDetail extends Device implements Serializable {

    private Long id;
    private String purchaseCode; //采购单号
    private String purchaseFunction; //采购用途
    private String purchaseUnitPrice; //采购单价
    private String purchaseNumber;//采购数量
    private Date purchaseDate; //采购时间


    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getPurchaseCode() {
        return purchaseCode;
    }

    public void setPurchaseCode(String purchaseCode) {
        this.purchaseCode = purchaseCode;
    }

    public String getPurchaseFunction() {
        return purchaseFunction;
    }

    public void setPurchaseFunction(String purchaseFunction) {
        this.purchaseFunction = purchaseFunction;
    }

    public String getPurchaseUnitPrice() {
        return purchaseUnitPrice;
    }

    public void setPurchaseUnitPrice(String purchaseUnitPrice) {
        this.purchaseUnitPrice = purchaseUnitPrice;
    }

    public String getPurchaseNumber() {
        return purchaseNumber;
    }

    public void setPurchaseNumber(String purchaseNumber) {
        this.purchaseNumber = purchaseNumber;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }
}
