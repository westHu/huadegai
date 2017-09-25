package com.hup.util;

/**
 * Created with IntelliJ IDEA.
 * Description: 设备编码生成类
 * User: west_
 * Date: 2017-09-24
 * Time: 22:42
 */
public class DeviceManagementUtil {

    private static String DMS = "DMS_";

    public static String deviceCode(){

        return DMS + System.currentTimeMillis();
    };

}
