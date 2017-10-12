package com.hup.controller;

import com.alibaba.fastjson.JSON;
import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
import com.hup.entity.ProcessTask;
import com.hup.response.TaskAuditResponse;
import com.hup.service.TaskService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 任务控制器
 * User: west_
 * Date: 2017-10-10
 * Time: 13:29
 */
@Controller
@RequestMapping("/task")
public class TaskController {

    Logger logger = LoggerFactory.getLogger(TaskController.class);

    @Autowired
    private TaskService taskService;

    @Autowired
    private DevicePurchaseService devicePurchaseService;

    @RequestMapping(value = "/audit", method = RequestMethod.GET)
    public String audit(String processType, String code, Model model) {
        logger.info("----->审核页面, processType = " + processType + ", code = " + code);
        StringBuilder builder = new StringBuilder();
        String title = "流程审核";
        List<String> comments = new ArrayList<>();
        if (processType.equalsIgnoreCase("devicePurchase")) {
            title = "采购单流程审核";
            DevicePurchase devicePurchase = devicePurchaseService.findOneByCode(code);
            if (null != devicePurchase) {
                builder.append(devicePurchase.getPurchaseCode()).append(",")
                        .append(devicePurchase.getPurchaseName()).append(",")
                        .append(devicePurchase.getPurchaseName()).append(",")
                        .append(devicePurchase.getPurchaseAgent()).append(",")
                        .append(devicePurchase.getPurchaseDate()).append(",")
                        .append(devicePurchase.getPurchasePaymentType());
                for (DevicePurchaseDetail detail : devicePurchase.getDevicePurchaseDetailList()) {
                    comments.add(JSON.toJSONString(detail));
                }
            }



        }
        TaskAuditResponse response = new TaskAuditResponse();
        response.setTitle(title);
        response.setContent(StringUtils.isBlank(builder.toString()) ? "审核内容？？" : builder.toString());
        model.addAttribute("response",response);
        return "flow/processAudit";
    }


    @RequestMapping(value = "/todoList", method = RequestMethod.GET)
    public String toDoList(ProcessTask toDoTask, Model model) {
        logger.info("----->工作流， 待办任务列表");
        String username = SecurityUtils.getSubject().getPrincipal().toString();
        toDoTask.setOwner(username);
        toDoTask.setStatus("todo");
        List<ProcessTask> toDoTaskList = taskService.processTaskList(toDoTask);
        model.addAttribute("toDoTaskList", toDoTaskList);
        model.addAttribute("flag", "任务管理,待办任务");
        return "flow/todoList";
    }
}
