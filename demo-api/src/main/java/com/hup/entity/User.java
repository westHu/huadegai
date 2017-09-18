package com.hup.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by hpj
 */
public class User implements Serializable {

    private Long id;            //主键
    private String userName;    //用户名
    private String password;    //密码
    private String roles;       //角色
    private boolean enable;     //账户状态
    private Date createDate;    //创建时间




    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", roles='" + roles + '\'' +
                ", enable=" + enable +
                ", createDate=" + createDate +
                '}';
    }


    //-----------------setter getter -------------------

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public boolean isEnable() {
        return enable;
    }

    public void setEnable(boolean enable) {
        this.enable = enable;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
