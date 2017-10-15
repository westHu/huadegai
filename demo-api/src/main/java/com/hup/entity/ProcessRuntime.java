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
    private String receipted; //签收人。可以多个，参考rule 规则
    private String executed;  //执行人
    private String auditOpinion; //审核建议 同意、拒绝
    private String comment; //执行评论
    private String remark;


    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getReceipted() {
        return receipted;
    }

    public void setReceipted(String receipted) {
        this.receipted = receipted;
    }

    public String getExecuted() {
        return executed;
    }

    public void setExecuted(String executed) {
        this.executed = executed;
    }

    public String getAuditOpinion() {
        return auditOpinion;
    }

    public void setAuditOpinion(String auditOpinion) {
        this.auditOpinion = auditOpinion;
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
