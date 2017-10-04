package com.hup.enums;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 17:17
 */
public class FlowEnum {


    /**
     * <p>@Description:  设备大类
     * <p>@Author: hupj
     * <p>@Date: 2017/9/24
     * <p>@Param:
     * <p>@return:
     */
    public enum Rule implements IBaseEnum{
        ONE("至少一个"),
        ALL("全部通过"),
        LEADER("部门领导");

        private String value; //

        Rule(String value) {
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


}
