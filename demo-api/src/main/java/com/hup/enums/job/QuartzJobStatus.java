package com.hup.enums.job;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-11-01
 * Time: 20:38
 */
public enum QuartzJobStatus {

    ON("运行中"), OFF("停止中");

    private String status;

    QuartzJobStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
