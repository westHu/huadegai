package com.hup.controller;

import com.hup.api.ResourceService;
import com.hup.api.UserService;
import com.hup.bind.annotation.CurrentUser;
import com.hup.entity.Resource;
import com.hup.entity.User;
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

    @RequestMapping("/")
    public String index(@CurrentUser User loginUser, Model model) {
        Set<String> permissions = userService.findPermissions(loginUser.getUsername());
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);

        //获取ws的token
        String token = UUIDUtil.getRandomString(10);
        model.addAttribute("token", token);

        return "index";
    }

    @RequestMapping("/index")
    public String welcome() {
        return "index";
    }


}
