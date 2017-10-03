package com.hup.entity;

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
    private int parentId;
    private boolean available;


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

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
