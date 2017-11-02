package com.hup.enums.job;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-11-02
 * Time: 11:22
 */
public enum QuartzJobType {

    SYSTEM("系统定时任务"), ADDITION ("手动定时任务");

    private String type;

    QuartzJobType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
