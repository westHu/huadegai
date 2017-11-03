package com.hup.enums.patrol;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-11-01
 * Time: 20:38
 */
public enum PatrolTaskStatus {

    READY("未开始"), DOING("进行中"), CANCEL("已取消"), OVERDUE("已过期"),
    DONE("已完成");

    private String status;


    PatrolTaskStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
