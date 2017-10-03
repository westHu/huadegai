package com.hup.entity;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 设备分类 树状
 * User: west_
 * Date: 2017-10-03
 * Time: 19:04
 */
public class DeviceCategory {

    private Long id;
    private String categoryName;
    private String categoryDesc;
    private Long parentId;
    private boolean available;

    //========非数据库属性=
    private List<DeviceCategory> nodes; //子节点列表
    private List<String> tags; //子节点个数
    private String parentName; //父节点名称


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDesc() {
        return categoryDesc;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    public List<DeviceCategory> getNodes() {
        return nodes;
    }

    public void setNodes(List<DeviceCategory> nodes) {
        this.nodes = nodes;
    }
}
