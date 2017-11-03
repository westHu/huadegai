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
import com.hup.entity.PatrolPlanDetail;
import com.hup.entity.PatrolTask;
import com.hup.entity.PatrolTaskDetail;
import com.hup.enums.patrol.PatrolTaskStatus;
import com.hup.util.date.DateUtils;
import org.apache.commons.collections.CollectionUtils;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @Autowired
    private PatrolPlanService patrolPlanService;

    @Autowired
    private PatrolTaskService patrolTaskService;
  
    @Override
    public void execute(JobExecutionContext arg0) throws JobExecutionException {
        logger.info("---巡检计划按条件生成巡检任务 开始---");
        JobDetail jobDetail = arg0.getJobDetail();
        String planName = jobDetail.getName();
        PatrolPlan plan = patrolPlanService.getPlanByName(planName);

        Date date = new Date();
        String format = "yyyyMMddHHmmss";
        PatrolTask patrolTask = new PatrolTask();
        patrolTask.setTaskName("TASK-"+ DateUtils.format(date, format));
        patrolTask.setTaskDesc("TASK-"+ DateUtils.format(date, format));
        patrolTask.setPlanName(plan.getPlanName());
        patrolTask.setTaskType("计划巡检");
        patrolTask.setTaskCreater("巡检计划生成");
        patrolTask.setTaskBeginTime(DateUtils.getCurrentDay()[0]);
        patrolTask.setTaskEndTime(DateUtils.getCurrentDay()[1]);
        patrolTask.setStatus(PatrolTaskStatus.READY.name()); //未开始，就绪
        patrolTaskService.insertTask(patrolTask);
        List<PatrolPlanDetail> detailList = plan.getDetailList();
        List<PatrolTaskDetail> taskDetails = new ArrayList<>();
        for (PatrolPlanDetail planDetail : detailList) {
            PatrolTaskDetail detail = new PatrolTaskDetail();
            detail.setPointId(planDetail.getPointId());
            detail.setDeviceCode(planDetail.getDeviceCode());
            detail.setTags(planDetail.getTags());
            taskDetails.add(detail);
        }
        if (CollectionUtils.isNotEmpty(taskDetails)) {
            patrolTaskService.batchInsertTaskDetail(taskDetails);
        }

        logger.info("---巡检计划按条件生成巡检任务 结束---");
    }
}  