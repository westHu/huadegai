package com.hup.enums;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 17:17
 */
public class DeviceEnum {


    /**
     * <p>@Description:  设备大类
     * <p>@Author: hupj
     * <p>@Date: 2017/9/24
     * <p>@Param:
     * <p>@return:
     */
    public enum DeviceBgType implements IBaseEnum{
        DETECTION_DEVICE("监测设备"),
        PRODUCTION_DEVICE("生产设备");

        private String value; //

        DeviceBgType(String value) {
            this.value = value;
        }

        //各个变量的getter,setter方法,注意这里是 public 公共的修饰符啊
        @Override
        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        @Override
        public int getCode() {
            return 0;
        }
        @Override
        public String getDesc() {
            return null;
        }
    }

    /**
     * <p>@Description: 设备子类
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    public enum DeviceSmType implements IBaseEnum{
        PDG("配电柜"),
        BYQ("变压器"),
        JYSB("加压水泵"),
        DJ("电机"),
        DJQDQ("电机启动柜"),
        JYXT("加药系统"),
        JLXT("加氯系统"),
        PLCG("PLC柜");

        private String value; //

        DeviceSmType(String value) {
            this.value = value;
        }

        //各个变量的getter,setter方法,注意这里是 public 公共的修饰符啊
        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        @Override
        public int getCode() {
            return 0;
        }
        @Override
        public String getDesc() {
            return null;
        }
    }



    /**
     * <p>@Description:  设备状态
     * //未安装、已安装（待运行）、已运行、报修中、已报废
     * <p>@Author: hupj
     * <p>@Date: 2017/9/24
     * <p>@Param:
     * <p>@return:
     */
    public enum DeviceStatus implements IBaseEnum{
        IN_HOUSE  ("已入库-未安装"),
        IN_STALLED("已安装-未运行"),
        IN_SERVICE("运行中"),
        IN_DAMAGED("未运行-损坏中"),
        IN_REPAIR ("未运行-报修中"),
        IN_SCRAPPED("已报废");

        private String value; //

        DeviceStatus(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }

        @Override
        public int getCode() {
            return 0;
        }

        @Override
        public String getDesc() {
            return null;
        }
    }
}
