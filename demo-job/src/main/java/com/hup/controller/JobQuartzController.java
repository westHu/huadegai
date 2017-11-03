package com.hup.controller;

import com.alibaba.fastjson.JSON;
import com.hup.enums.job.QuartzJobStatus;
import com.hup.response.BaseResponse;
import com.hup.service.QuartzJob;
import com.hup.service.QuartzManager;
import com.hup.util.PageRequest;
import com.hup.util.PageUtils;
import com.hup.api.job.JobQuartzService;
import com.hup.db.Pager;
import com.hup.entity.JobQuartz;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by nt on
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/quartz")
public class JobQuartzController {

    Logger logger = LoggerFactory.getLogger(JobQuartzController.class);

    @Autowired
    private JobQuartzService jobQuartzService;

    @Autowired
    private QuartzManager quartzManager;
    /**
     * <p>@Description: 定时任务列表
     * <p>@Author: hupj
     * <p>@Date: 2017/10.28
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("job:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(String msg, JobQuartz jobQuartz, PageRequest pageRequest, Model model) {
        logger.info("-----> 定时任务列表页面 --");
        Pager<JobQuartz> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = jobQuartzService.queryJobQuartzList(jobQuartz, pager);
        model.addAttribute("pager", pager);


        List<JobQuartz> quartzList = quartzManager.jobList();
        logger.info("quartzList == " + JSON.toJSONString(quartzList));
        model.addAttribute("quartzList", quartzList);

        if (StringUtils.isNotBlank(msg)) {
            model.addAttribute("msg", msg);
        }
        model.addAttribute("flag", "系统设置,任务管理");
        return "job/jobQuartzList";
    }


    @ResponseBody
    @RequestMapping(value = "/{id}/start", method = RequestMethod.POST)
    public BaseResponse startJob(@PathVariable("id") Long id) {
        logger.info("-----> 启动定时任务 --id : " + id);
        JobQuartz jobQuartz = jobQuartzService.findOne(id);
        quartzManager.addJob(jobQuartz.getJobName(), QuartzJob.class, jobQuartz.getTime());

        jobQuartz.setStatus(QuartzJobStatus.ON.getStatus()); //运行中
        jobQuartzService.updateStatus(jobQuartz);
        return new BaseResponse("0", "定时任务启动成功！");
    }


    @ResponseBody
    @RequestMapping(value = "/{id}/stop", method = RequestMethod.POST)
    public BaseResponse stopJob(@PathVariable("id") Long id) {
        logger.info("-----> 暂停定时任务 --id : " + id);
        JobQuartz jobQuartz = jobQuartzService.findOne(id);
        quartzManager.removeJob(jobQuartz.getJobName());
        jobQuartz.setStatus(QuartzJobStatus.OFF.getStatus()); //停止中
        jobQuartzService.updateStatus(jobQuartz);
        return new BaseResponse("0", "定时任务暂停成功！");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String quartzCreate(JobQuartz jobQuartz) {
        logger.info("-----> 暂停定时任务 --jobQuartz : " + JSON.toJSONString(jobQuartz));
        jobQuartz.setStatus(QuartzJobStatus.OFF.getStatus()); //停止中
        jobQuartzService.insertJobQuartz(jobQuartz);
        return "redirect:/quartz/list";
    }


}
