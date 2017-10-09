package com.hup.api.message;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description: WebSocket 连接服务所需要的token
 * User: west_
 * Date: 2017-10-09
 * Time: 12:52
 */
public class WsToken {

    private Long id;
    private String token; //凭证字符串
    private String platform; //平台
    private Long userId;  //外部系统用户id
    private String role; //角色
    private Boolean expired; //是否过期
    private Boolean active; //是否活跃的,即是否在线
    private Boolean deleted;  //是否删除
    private Date createTime; //创建时间
    private Date updateTime;  //修改时间


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Boolean getExpired() {
        return expired;
    }

    public void setExpired(Boolean expired) {
        this.expired = expired;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}
