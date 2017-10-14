package com.hup.controller;

import com.hup.api.ResourceService;
import com.hup.api.UserService;
import com.hup.bind.annotation.CurrentUser;
import com.hup.entity.ProcessTask;
import com.hup.entity.Resource;
import com.hup.entity.User;
import com.hup.service.TaskService;
import com.hup.util.uuid.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Set;

/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Controller
public class IndexController {

    @Autowired
    private ResourceService resourceService;

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @RequestMapping("/")
    public String index(@CurrentUser User loginUser, Model model) {
        Set<String> permissions = userService.findPermissions(loginUser.getUsername());
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);

        //获取ws的token
        String token = UUIDUtil.getRandomString(10);
        model.addAttribute("token", token);

        //待办任务
        ProcessTask task = new ProcessTask();
        task.setStatus("todo");
        task.setOwner(loginUser.getUsername());
        List<ProcessTask> processTaskList = taskService.processTaskList(task);
        if (processTaskList.size() < 5 ){
            for (int i= 0; i < 5; i++) {
                processTaskList.add(new ProcessTask());
            }
        }
        model.addAttribute("processTaskList", processTaskList.subList(0,5));
        //


        return "index";
    }

    @RequestMapping("/index")
    public String welcome() {
        return "redirect:/";
    }


}
