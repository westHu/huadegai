package com.hup.util.codeCreate;

/**
 * Created with IntelliJ IDEA.
 * Description: 设备编码生成类
 * User: west_
 * Date: 2017-09-24
 * Time: 22:42
 */
public class PatrolUtil {

    private static String PLAN_CODE = "PPC";


    public static String PLAN_CODE(){
        return PLAN_CODE + System.currentTimeMillis();
    }


}
