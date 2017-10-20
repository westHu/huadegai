package com.hup.controller.patrol;


import com.alibaba.fastjson.JSON;
import com.hup.api.patrol.PatrolTaskService;
import com.hup.api.patrol.PatrolPointService;
import com.hup.db.Pager;
import com.hup.entity.PatrolTask;
import com.hup.entity.PatrolPoint;
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
 * 记录：巡检过程每个设备的巡检结果，  考核  完成率  超时率 故障率
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/patrol")
public class PatrolTaskController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PatrolTaskService patrolTaskService;

    @Autowired
    private PatrolPointService patrolPointService;


    @RequestMapping(value = "/taskList", method = RequestMethod.GET)
    public String taskList(String msg, PatrolTask patrolTask, PageRequest pageRequest, Model model){
        logger.info(" --- 巡检任务列表 patrolTask = " + JSON.toJSONString(patrolTask));
        Pager<PatrolTask> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = patrolTaskService.queryPatrolTaskList(patrolTask, pager);
        model.addAttribute("pager" ,pager);

        if (StringUtils.isNotBlank(msg)) {
            model.addAttribute("msg", msg);
        }
        model.addAttribute("request", patrolTask);
        return "patrol/patrolTaskList";
    }



    @RequestMapping(value = "/taskCreate", method = RequestMethod.GET)
    public String taskCreateForm(Model model) {
        logger.info("----巡检任务 新增页面 -- ");
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        PatrolTask patrolTask = new PatrolTask();
        patrolTask.setTaskCreater(username);
        model.addAttribute("patrolTask", patrolTask);
        List<PatrolPoint> pointList = patrolPointService.findAllPatrolPoint();
        model.addAttribute("pointList", pointList);
        model.addAttribute("op", "新增");
        return "patrol/patrolTaskCreate";
    }


    @RequestMapping(value = "/taskCreate", method = RequestMethod.POST)
    public String taskCreate(PatrolTask patrolTask, RedirectAttributes redirectAttributes) {
        logger.info("----添加巡检任务  -- patrolTask : " + JSON.toJSONString(patrolTask));
        patrolTask.setTaskName(PatrolUtil.PLAN_CODE());
        patrolTaskService.insertTask(patrolTask);
        redirectAttributes.addAttribute("msg", "巡检任务添加成功");
        return "redirect:/patrol/taskList";
    }



    @ResponseBody
    @RequestMapping(value = "/taskDelete", method = RequestMethod.DELETE)
    public BaseResponse taskDelete(@RequestBody PatrolTask patrolTask) {
        logger.info("----巡检点删除 -- patrolTask id = " + patrolTask.getId());
        patrolTaskService.deleteTask(patrolTask.getId());
        return new BaseResponse("0","巡检点删除成功！", null);
    }
}
