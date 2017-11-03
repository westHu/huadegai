package com.hup.util;

import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.scheduling.quartz.AdaptableJobFactory;

public class JobFactory extends AdaptableJobFactory {
    @Autowired 
    private AutowireCapableBeanFactory capableBeanFactory;  

    @Override 
    protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {
        System.out.println("=============== " + bundle.getNextFireTime());
        //调用父类的方法
        Object jobInstance = super.createJobInstance(bundle);  
        //进行注入  
        capableBeanFactory.autowireBean(jobInstance);
        System.out.println("=============== " + jobInstance.getClass().getName());
        return jobInstance;  
    }
}