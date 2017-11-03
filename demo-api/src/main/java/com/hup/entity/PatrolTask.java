package com.hup.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 巡检计划
 * User: west_
 * Date: 2017-10-17
 * Time: 20:42
 */
public class PatrolTask {

    private Long id;
    private String taskName; //名称
    private String taskDesc; //描述
    private String planName; //计划名称
    private String taskType; //任务分类
    private String taskCreater; //任务创建者
    private Long estimatedTime; //预计耗时 单位：分

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date taskBeginTime; //任务允许开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date taskEndTime; //任务允许结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date practiceBeginTime; //实际开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date practiceEndTime; //实际结束时间

    private String agent;
    private String remark;
    private String status; //未开始、进行中、已作废、已过期、已完成
    private Date createDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public String getTaskCreater() {
        return taskCreater;
    }

    public void setTaskCreater(String taskCreater) {
        this.taskCreater = taskCreater;
    }

    public Long getEstimatedTime() {
        return estimatedTime;
    }

    public void setEstimatedTime(Long estimatedTime) {
        this.estimatedTime = estimatedTime;
    }

    public Date getTaskBeginTime() {
        return taskBeginTime;
    }

    public void setTaskBeginTime(Date taskBeginTime) {
        this.taskBeginTime = taskBeginTime;
    }

    public Date getTaskEndTime() {
        return taskEndTime;
    }

    public void setTaskEndTime(Date taskEndTime) {
        this.taskEndTime = taskEndTime;
    }

    public Date getPracticeBeginTime() {
        return practiceBeginTime;
    }

    public void setPracticeBeginTime(Date practiceBeginTime) {
        this.practiceBeginTime = practiceBeginTime;
    }

    public Date getPracticeEndTime() {
        return practiceEndTime;
    }

    public void setPracticeEndTime(Date practiceEndTime) {
        this.practiceEndTime = practiceEndTime;
    }

    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
