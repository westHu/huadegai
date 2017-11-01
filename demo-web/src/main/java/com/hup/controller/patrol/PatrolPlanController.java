package com.hup.controller.patrol;


import com.alibaba.fastjson.JSON;
import com.hup.api.job.JobQuartzService;
import com.hup.api.patrol.PatrolPlanService;
import com.hup.api.patrol.PatrolPointService;
import com.hup.db.Pager;
import com.hup.entity.JobQuartz;
import com.hup.entity.PatrolPlan;
import com.hup.entity.PatrolPoint;
import com.hup.enums.job.QuartzJobStatus;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.PageUtils;
import com.hup.util.codeCreate.PatrolUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/patrol")
public class PatrolPlanController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PatrolPlanService patrolPlanService;

    @Autowired
    private PatrolPointService patrolPointService;

    @Autowired
    private JobQuartzService jobQuartzService;


    @RequestMapping(value = "/planList", method = RequestMethod.GET)
    public String planList(String msg, PatrolPlan patrolPlan, PageRequest pageRequest, Model model){
        logger.info(" --- 巡检计划列表 patrolPlan = " + JSON.toJSONString(patrolPlan));
        Pager<PatrolPlan> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = patrolPlanService.queryPatrolPlanList(patrolPlan, pager);
        model.addAttribute("pager" ,pager);

        if (StringUtils.isNotBlank(msg)) {
            model.addAttribute("msg", msg);
        }
        model.addAttribute("request", patrolPlan);
        return "patrol/patrolPlanList";
    }



    @RequestMapping(value = "/planCreate", method = RequestMethod.GET)
    public String planCreateForm(Model model) {
        logger.info("----巡检计划 新增页面 -- ");
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        PatrolPlan patrolPlan = new PatrolPlan();
        patrolPlan.setPlanCreater(username);
        model.addAttribute("patrolPlan", patrolPlan);
        List<PatrolPoint> pointList = patrolPointService.findAllPatrolPoint();
        model.addAttribute("pointList", pointList);
        model.addAttribute("op", "新增");
        return "patrol/patrolPlanCreate";
    }


    @RequestMapping(value = "/planCreate", method = RequestMethod.POST)
    public String planCreate(PatrolPlan patrolPlan, RedirectAttributes redirectAttributes) {
        logger.info("----添加巡检计划  -- patrolPlan : " + JSON.toJSONString(patrolPlan));
        patrolPlan.setPlanName(PatrolUtil.PLAN_CODE());
        patrolPlanService.insertPlan(patrolPlan);
        redirectAttributes.addAttribute("msg", "巡检计划添加成功");
        return "redirect:/patrol/planList";
    }



    @ResponseBody
    @RequestMapping(value = "/planDelete", method = RequestMethod.DELETE)
    public BaseResponse planDelete(@RequestBody PatrolPlan patrolPlan) {
        logger.info("----巡检计划删除 -- patrolPlan id = " + patrolPlan.getId());
        patrolPlanService.deletePlan(patrolPlan.getId());
        return new BaseResponse("0","巡检计划删除成功！", null);
    }


    @ResponseBody
    @RequestMapping(value = "/createQuartzJob", method = RequestMethod.POST)
    public BaseResponse planCreateQuartzJob(@RequestBody PatrolPlan patrolPlan) {
        logger.info("----巡检计划生成定时任务 -- patrolPlan id = " + patrolPlan.getId());
        PatrolPlan plan = patrolPlanService.getPlan(patrolPlan.getId());
        if (plan == null ) return null;
        //判断是否已经生成？
        JobQuartz one = jobQuartzService.findOneByJobName(plan.getPlanName());
        if (one != null) {
            return new BaseResponse("0","关联该计划的定时任务已经生成！", null);
        }
        JobQuartz quartz = new JobQuartz();
        quartz.setJobName(plan.getPlanName());
        quartz.setJobGroupName(plan.getPlanName());
        quartz.setTriggerName(plan.getPlanDesc());
        quartz.setTriggerGroupName(plan.getPlanDesc());
        quartz.setJobCreater("巡检计划生成");
        quartz.setJobType("系统定时任务");
        quartz.setStatus(QuartzJobStatus.OFF.getStatus());//停止中
        quartz.setRemark(plan.getPlanDesc());

        String time = "0 0/min * * * ? *";
        time = time.replace("min", plan.getPlanPerHour().toString());
        quartz.setTime(time);
        jobQuartzService.insertJobQuartz(quartz);

        //更新巡检计划 已关联任务
        plan.setRelatedQuartzJob(1);
        patrolPlanService.updatePlanRelatedJob(plan);

        return new BaseResponse("0","巡检点删除成功！", null);
    }


    @ResponseBody
    @RequestMapping(value = "/deleteQuartzJob", method = RequestMethod.POST)
    public BaseResponse planDeleteQuartzJob(@RequestBody PatrolPlan patrolPlan) {
        logger.info("----巡检计划删除定时任务 -- patrolPlan id = " + patrolPlan.getId());
        PatrolPlan plan = patrolPlanService.getPlan(patrolPlan.getId());
        if (plan == null ) return null;
        //判断是否已经生成？
        JobQuartz one = jobQuartzService.findOneByJobName(plan.getPlanName());
        if (one == null) {
            return new BaseResponse("0","关联该计划的定时任务已经删除！", null);
        }
        jobQuartzService.deleteJobQuartz(one.getId());
        //更新巡检计划 已删除任务
        plan.setRelatedQuartzJob(0);
        patrolPlanService.updatePlanRelatedJob(plan);
        return new BaseResponse("0","关联该计划的定时任务删除成功！", null);
    }

}
