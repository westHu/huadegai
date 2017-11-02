package com.hup.service;

import com.hup.api.job.JobQuartzService;
import com.hup.api.patrol.PatrolPlanService;
import com.hup.api.patrol.PatrolPointService;
import com.hup.entity.JobQuartz;
import com.hup.entity.PatrolPlan;
import com.hup.enums.job.QuartzJobStatus;
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

        List<JobQuartz> jobList = jobQuartzService.getQuartzJobByStatus(QuartzJobStatus.ON.getStatus());
        for (JobQuartz quartz : jobList) {
            //启动任务
            QuartzManager.addJob(quartz.getJobName(), QuartzJob.class, quartz.getTime());

        }
    }

    public void destroy(){
        int delete = jobQuartzService.deleteJobQuartzByType("system");
    }

}
