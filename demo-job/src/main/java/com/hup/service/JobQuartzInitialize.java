package com.hup.service;

import com.hup.api.job.JobQuartzService;
import com.hup.api.patrol.PatrolPlanService;
import com.hup.api.patrol.PatrolPointService;
import com.hup.entity.JobQuartz;
import com.hup.entity.PatrolPlan;
import jdk.nashorn.internal.scripts.JO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-21
 * Time: 10:58
 */
@Service
public class JobQuartzInitialize {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PatrolPlanService patrolPlanService;

    @Autowired
    private JobQuartzService jobQuartzService;


    /**
     * <p>@Description:  根据巡检计划生成定时任务， 再根据定时任务生成巡检任务
     * <p>@Author: hupj
     * <p>@Date: 2017/10/21
     * <p>@Param:
     * <p>@return:
     */
    public void init() throws Exception {
        logger.info("-- 根据巡检计划生成定时任务 -- " + new Date());
        List<PatrolPlan> planList = patrolPlanService.getAllPatrolPlan();

        int delete = jobQuartzService.deleteJobQuartzByType("system");
        for (PatrolPlan plan : planList) {
            JobQuartz quartz = new JobQuartz();
            quartz.setJobName(plan.getPlanName());
            quartz.setJobGroupName("系统默认");
            quartz.setTriggerName("系统默认");
            quartz.setTriggerGroupName("系统默认");
            quartz.setJobCreater("巡检计划生成");
            quartz.setJobType("system");
            quartz.setStatus("停止中");
            quartz.setRemark(plan.getPlanDesc());

            String time = "0 0/min * * * ? *";
            time = time.replace("min", plan.getPlanPerHour().toString());
            quartz.setTime(time);
            jobQuartzService.insertJobQuartz(quartz);

            plan.setRelatedQuartzJob(1);
            patrolPlanService.updatePlanRelatedJob(plan);

        }
    }

    public void destroy(){
        int delete = jobQuartzService.deleteJobQuartzByType("system");
    }

}
