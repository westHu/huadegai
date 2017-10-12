package com.hup.entity;

/**
 * Created with IntelliJ IDEA.
 * Description: 流程定义
 * User: west_
 * Date: 2017-10-10
 * Time: 16:07
 */
public class ProcessDefinition {

    private Long id;
    private String name;  //流程号
    private String desc;  //流程名称  流程描述
    private Integer step; //步骤节点
    private String stepDesc; //节点描述
    private String members; //多个人员
    private String groups;  //多个组
    private String rule;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Integer getStep() {
        return step;
    }

    public void setStep(Integer step) {
        this.step = step;
    }

    public String getStepDesc() {
        return stepDesc;
    }

    public void setStepDesc(String stepDesc) {
        this.stepDesc = stepDesc;
    }

    public String getMembers() {
        return members;
    }

    public void setMembers(String members) {
        this.members = members;
    }

    public String getGroups() {
        return groups;
    }

    public void setGroups(String groups) {
        this.groups = groups;
    }

    public String getRule() {
        return rule;
    }

    public void setRule(String rule) {
        this.rule = rule;
    }
}
