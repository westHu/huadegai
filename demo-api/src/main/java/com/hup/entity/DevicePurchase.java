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
public class DevicePurchase  implements Serializable {

    private Long id;
    private String purchaseCode; //采购单号
    private String purchaseName; //采购单名称;
    private String purchaseAgent; //采购人员
    private String paymentType; //付款方式
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date purchaseDate; //采购时间
    private String remark;
    private String auditors;  //审核人员

    //=======非数据库字段
    private List<DevicePurchaseDetail> devicePurchaseDetailList; //明细列表

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPurchaseCode() {
        return purchaseCode;
    }

    public void setPurchaseCode(String purchaseCode) {
        this.purchaseCode = purchaseCode;
    }

    public String getPurchaseName() {
        return purchaseName;
    }

    public void setPurchaseName(String purchaseName) {
        this.purchaseName = purchaseName;
    }

    public String getPurchaseAgent() {
        return purchaseAgent;
    }

    public void setPurchaseAgent(String purchaseAgent) {
        this.purchaseAgent = purchaseAgent;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAuditors() {
        return auditors;
    }

    public void setAuditors(String auditors) {
        this.auditors = auditors;
    }

    public List<DevicePurchaseDetail> getDevicePurchaseDetailList() {
        return devicePurchaseDetailList;
    }

    public void setDevicePurchaseDetailList(List<DevicePurchaseDetail> devicePurchaseDetailList) {
        this.devicePurchaseDetailList = devicePurchaseDetailList;
    }
}
