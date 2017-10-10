package com.hup.controller;

import com.hup.entity.ToDoTask;
import com.hup.service.TaskService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    @RequestMapping(value = "/todoList", method = RequestMethod.GET)
    public String toDoList(ToDoTask toDoTask, Model model) {
        logger.info("----->工作流， 待办任务列表");
        String username = SecurityUtils.getSubject().getPrincipal().toString();
        toDoTask.setOwner(username);
        toDoTask.setStatus("todo");
        List<ToDoTask> toDoTaskList = taskService.toDoList(toDoTask);
        model.addAttribute("toDoTaskList", toDoTaskList);
        model.addAttribute("flag", "任务管理,待办任务");
        return "flow/todoList";
    }
}
