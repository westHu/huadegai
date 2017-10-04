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
    private String purchaseReason; //采购目的
    private String purchasePaymentType; //付款方式
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date purchaseDate; //采购时间
    private String purchaseRemark; //采购备注
    private String purchaseAuditors;  //审核人员

    //=======非数据库字段
    private List<DevicePurchaseDetail> devicePurchaseDetailList; //明细列表




    public Long getId() {
        return id;
    }



    public String getPurchaseReason() {
        return purchaseReason;
    }

    public void setPurchaseReason(String purchaseReason) {
        this.purchaseReason = purchaseReason;
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

    public String getPurchasePaymentType() {
        return purchasePaymentType;
    }

    public void setPurchasePaymentType(String purchasePaymentType) {
        this.purchasePaymentType = purchasePaymentType;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getPurchaseRemark() {
        return purchaseRemark;
    }

    public void setPurchaseRemark(String purchaseRemark) {
        this.purchaseRemark = purchaseRemark;
    }

    public String getPurchaseAuditors() {
        return purchaseAuditors;
    }

    public void setPurchaseAuditors(String purchaseAuditors) {
        this.purchaseAuditors = purchaseAuditors;
    }

    public List<DevicePurchaseDetail> getDevicePurchaseDetailList() {
        return devicePurchaseDetailList;
    }

    public void setDevicePurchaseDetailList(List<DevicePurchaseDetail> devicePurchaseDetailList) {
        this.devicePurchaseDetailList = devicePurchaseDetailList;
    }
}
