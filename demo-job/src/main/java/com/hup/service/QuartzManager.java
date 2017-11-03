package com.hup.service;

/**
 * @Description:  
 * 
 * @Title: QuartzManager.java 
 * @Package
 * @Copyright: Copyright (c) 2014 
 * 
 * @author
 * @date 2014-6-26 下午03:15:52 
 * @version V2.0 
 */  

  
import com.hup.entity.JobQuartz;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/** 
 * @Description: 定时任务管理类 
 *  
 * @ClassName: QuartzManager 
 * @Copyright: Copyright (c) 2014 
 * @version V2.0
 */
@Service
public class QuartzManager {


    @Autowired
    private Scheduler scheduler;

    //private static SchedulerFactory gSchedulerFactory = new StdSchedulerFactory();
    private static String JOB_GROUP_NAME = "EXTJWEB_JOBGROUP_NAME";  
    private static String TRIGGER_GROUP_NAME = "EXTJWEB_TRIGGERGROUP_NAME";




    public  List<JobQuartz> jobList(){
        List<JobQuartz> quartzList = new ArrayList<>();
        try {
            //Scheduler scheduler = gSchedulerFactory.getScheduler();
            for (String groupName : scheduler.getJobGroupNames()) {
                for (String jobName : scheduler.getJobNames(groupName)) {
                    Trigger[] triggers = scheduler.getTriggersOfJob(jobName,groupName);
                    //Date nextFireTime = triggers[0].getNextFireTime();
                    JobQuartz quartz = new JobQuartz();
                    quartz.setJobName(jobName);
                    quartz.setJobGroupName(groupName);
                    quartz.setTriggerName(triggers[0].getName());
                    quartz.setTriggerGroupName(triggers[0].getGroup());
                    quartzList.add(quartz);
                }
            }
        }catch (Exception e){
            throw new RuntimeException(e);
        }
        return quartzList;
    }


    /** 
     * @Description: 添加一个定时任务，使用默认的任务组名，触发器名，触发器组名 
     *  
     * @param jobName 
     *            任务名 
     * @param cls 
     *            任务 
     * @param time 
     *            时间设置，参考quartz说明文档 
     *  
     */
    @SuppressWarnings("unchecked")  
    public  void addJob(String jobName, Class cls, String time) {
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            JobDetail jobDetail = new JobDetail(jobName, JOB_GROUP_NAME, cls);// 任务名，任务组，任务执行类  
            // 触发器  
            CronTrigger trigger = new CronTrigger(jobName, TRIGGER_GROUP_NAME);// 触发器名,触发器组  
            trigger.setCronExpression(time);// 触发器时间设定  
            scheduler.scheduleJob(jobDetail, trigger);
            // 启动
            if (!scheduler.isShutdown()) {
                scheduler.start();
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description: 添加一个定时任务 
     *  
     * @param jobName 
     *            任务名 
     * @param jobGroupName 
     *            任务组名 
     * @param triggerName 
     *            触发器名 
     * @param triggerGroupName 
     *            触发器组名 
     * @param jobClass 
     *            任务 
     * @param time 
     *            时间设置，参考quartz说明文档 
     * @version V2.0
     */  
    @SuppressWarnings("unchecked")  
    public  void addJob(String jobName, String jobGroupName,
            String triggerName, String triggerGroupName, Class jobClass,  
            String time) {  
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            JobDetail jobDetail = new JobDetail(jobName, jobGroupName, jobClass);// 任务名，任务组，任务执行类  
            // 触发器  
            CronTrigger trigger = new CronTrigger(triggerName, triggerGroupName);// 触发器名,触发器组  
            trigger.setCronExpression(time);// 触发器时间设定  
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description: 修改一个任务的触发时间(使用默认的任务组名，触发器名，触发器组名) 
     *  
     * @param jobName 
     * @param time 
     *  
     * @Title: QuartzManager.java 
     * @Copyright: Copyright (c) 2014 
     *  
     */
    @SuppressWarnings("unchecked")  
    public  void modifyJobTime(String jobName, String time) {
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(jobName,TRIGGER_GROUP_NAME);
            if (trigger == null) {  
                return;  
            }  
            String oldTime = trigger.getCronExpression();  
            if (!oldTime.equalsIgnoreCase(time)) {  
                JobDetail jobDetail = scheduler.getJobDetail(jobName,JOB_GROUP_NAME);
                Class objJobClass = jobDetail.getJobClass();  
                removeJob(jobName);  
                addJob(jobName, objJobClass, time);  
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description: 修改一个任务的触发时间 
     *  
     * @param triggerName 
     * @param triggerGroupName 
     * @param time 
     *  
     * @Title: QuartzManager.java 
     * @Copyright: Copyright (c) 2014 
     *  
     */
    public  void modifyJobTime(String triggerName,
            String triggerGroupName, String time) {  
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerName,triggerGroupName);
            if (trigger == null) {  
                return;  
            }  
            String oldTime = trigger.getCronExpression();  
            if (!oldTime.equalsIgnoreCase(time)) {  
                CronTrigger ct = (CronTrigger) trigger;  
                // 修改时间  
                ct.setCronExpression(time);  
                // 重启触发器  
                scheduler.resumeTrigger(triggerName, triggerGroupName);
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description: 移除一个任务(使用默认的任务组名，触发器名，触发器组名) 
     *  
     * @param jobName 
     *  
     * @Title: QuartzManager.java 
     * @Copyright: Copyright (c) 2014 
     */
    public  void removeJob(String jobName) {
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            scheduler.pauseTrigger(jobName, TRIGGER_GROUP_NAME);// 停止触发器
            scheduler.unscheduleJob(jobName, TRIGGER_GROUP_NAME);// 移除触发器
            scheduler.deleteJob(jobName, JOB_GROUP_NAME);// 删除任务
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description: 移除一个任务 
     *  
     * @param jobName 
     * @param jobGroupName 
     * @param triggerName 
     * @param triggerGroupName 
     *  
     * @Title: QuartzManager.java 
     * @Copyright: Copyright (c) 2014 
     */
    public  void removeJob(String jobName, String jobGroupName,
            String triggerName, String triggerGroupName) {  
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            scheduler.pauseTrigger(triggerName, triggerGroupName);// 停止触发器
            scheduler.unscheduleJob(triggerName, triggerGroupName);// 移除触发器
            scheduler.deleteJob(jobName, jobGroupName);// 删除任务
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description:启动所有定时任务 
     *  
     *  
     * @Title: QuartzManager.java 
     * @Copyright: Copyright (c) 2014 
     */
    public  void startJobs() {
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            scheduler.start();
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
  
    /** 
     * @Description:关闭所有定时任务 
     *  
     *  
     * @Title: QuartzManager.java 
     * @Copyright: Copyright (c) 2014 
     */
    public  void shutdownJobs() {
        try {  
            //Scheduler sched = gSchedulerFactory.getScheduler();
            if (!scheduler.isShutdown()) {
                scheduler.shutdown();
            }  
        } catch (Exception e) {  
            throw new RuntimeException(e);  
        }  
    }  
}  