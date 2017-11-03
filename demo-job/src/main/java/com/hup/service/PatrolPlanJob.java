/** 
 * @Description:  
 * 
 * @Title: QuartzJob.java 
 * @Package com.joyce.quartz 
 * @Copyright: Copyright (c) 2014 
 * 
 * @author Comsys-LZP 
 * @date 2014-6-26 下午03:37:11 
 * @version V2.0 
 */
package com.hup.service;

import com.hup.api.patrol.PatrolPlanService;
import com.hup.api.patrol.PatrolTaskService;
import com.hup.entity.PatrolPlan;
import com.hup.entity.PatrolTask;
import com.hup.enums.patrol.PatrolTaskStatus;
import com.hup.service.patrol.PatrolPlanServiceImpl;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/** 
 * @Description: 任务执行类 
 * 
 * @ClassName: QuartzJob 
 * @Copyright: Copyright (c) 2014 
 * 
 * @author
 * @date 2
 * @version V2.0 
 */

public class PatrolPlanJob implements Job {

    Logger logger = LoggerFactory.getLogger(PatrolPlanJob.class);

  
    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
//        ApplicationContext ac = new FileSystemXmlApplicationContext("classpath:spring-context.xml");
        PatrolPlanServiceImpl patrolPlanService = new PatrolPlanServiceImpl();

        logger.info("---巡检计划按条件生成巡检任务 开始---");
        JobDetail jobDetail = arg0.getJobDetail();
        String planName = jobDetail.getName();
        logger.info("planName -- " + planName);
        PatrolPlan plan = patrolPlanService.getPlanByName(planName);

        PatrolTask patrolTask = new PatrolTask();
        patrolTask.setTaskName("TASK-"+plan.getPlanName());
        patrolTask.setTaskDesc("TASK-"+plan.getPlanDesc());
        patrolTask.setPlanName(plan.getPlanName());
        patrolTask.setTaskType("计划巡检");
        patrolTask.setTaskCreater("巡检计划生成");
        patrolTask.setTaskBeginTime(new Date());
        patrolTask.setTaskEndTime(new Date());
        patrolTask.setStatus(PatrolTaskStatus.READY.name()); //未开始，就绪
        //patrolTaskService.insertTask(patrolTask);
        logger.info("---巡检计划按条件生成巡检任务 结束---");
    }
}  