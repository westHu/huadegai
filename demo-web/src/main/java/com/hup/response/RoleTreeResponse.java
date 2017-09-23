package com.hup.response;

import com.hup.entity.Resource;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-23
 * Time: 10:31
 */
public class RoleTreeResponse {
    private String name;
    private List<String> sonResourceList;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<String> getSonResourceList() {
        return sonResourceList;
    }

    public void setSonResourceList(List<String> sonResourceList) {
        this.sonResourceList = sonResourceList;
    }
}
