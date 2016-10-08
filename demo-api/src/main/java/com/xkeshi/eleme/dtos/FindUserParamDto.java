package com.xkeshi.eleme.dtos;

import java.io.Serializable;

/**
 * Created by nt on 2016-10-08.
 *
 * 查询入参超过三个参数，包装成一个dto对象
 */
public class FindUserParamDto implements Serializable {

    private String param1;

    private String param2;

    private String param3;

    private String param4;

    private String param5;

    public String getParam1() {
        return param1;
    }

    public void setParam1(String param1) {
        this.param1 = param1;
    }

    public String getParam2() {
        return param2;
    }

    public void setParam2(String param2) {
        this.param2 = param2;
    }

    public String getParam3() {
        return param3;
    }

    public void setParam3(String param3) {
        this.param3 = param3;
    }

    public String getParam4() {
        return param4;
    }

    public void setParam4(String param4) {
        this.param4 = param4;
    }

    public String getParam5() {
        return param5;
    }

    public void setParam5(String param5) {
        this.param5 = param5;
    }
}
