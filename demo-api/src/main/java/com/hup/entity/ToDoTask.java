package com.hup.entity;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 待办任务
 * User: west_
 * Date: 2017-10-10
 * Time: 13:20
 */
public class ToDoTask {

    private Long id;
    private String code; //待办编码
    private String name; //待办任务名称
    private String url; //待办任务具体操作界面
    private String status; //状态
    private String owner; //待办任务操作人
    private String emergencyState = "normal";
    private Date createDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getEmergencyState() {
        return emergencyState;
    }

    public void setEmergencyState(String emergencyState) {
        this.emergencyState = emergencyState;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
