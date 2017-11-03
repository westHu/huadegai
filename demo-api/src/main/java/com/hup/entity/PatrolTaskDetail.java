package com.hup.entity;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: 巡检计划
 * User: west_
 * Date: 2017-10-17
 * Time: 20:42
 */
public class PatrolTaskDetail {

    private Long id;
    private Long taskId; //名称
    private Long pointId;
    private String deviceCode;
    private String tags;
    private String resultMsg;
    private String resultImg;
    private String resultVoice;
    private String resultVideo;

    private Date createDate;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public Long getPointId() {
        return pointId;
    }

    public void setPointId(Long pointId) {
        this.pointId = pointId;
    }

    public String getDeviceCode() {
        return deviceCode;
    }

    public void setDeviceCode(String deviceCode) {
        this.deviceCode = deviceCode;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public String getResultImg() {
        return resultImg;
    }

    public void setResultImg(String resultImg) {
        this.resultImg = resultImg;
    }

    public String getResultVoice() {
        return resultVoice;
    }

    public void setResultVoice(String resultVoice) {
        this.resultVoice = resultVoice;
    }

    public String getResultVideo() {
        return resultVideo;
    }

    public void setResultVideo(String resultVideo) {
        this.resultVideo = resultVideo;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
