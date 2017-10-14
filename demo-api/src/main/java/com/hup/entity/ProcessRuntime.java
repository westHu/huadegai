package com.hup.entity;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-10
 * Time: 16:09
 */
public class ProcessRuntime extends  ProcessDefinition{

    private String code;
    private Boolean receipted; //流程是否已签收
    private Boolean executed;  //流程是否已执行
    private String comment; //执行评论
    private String remark;


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Boolean getReceipted() {
        return receipted;
    }

    public void setReceipted(Boolean receipted) {
        this.receipted = receipted;
    }

    public Boolean getExecuted() {
        return executed;
    }

    public void setExecuted(Boolean executed) {
        this.executed = executed;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
