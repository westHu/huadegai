package com.hup.controller;

import com.hup.api.OrganizationService;
import com.hup.api.RoleService;
import com.hup.api.UserService;
import com.hup.entity.User;
import com.hup.response.BaseResponse;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private OrganizationService organizationService;
    @Autowired
    private RoleService roleService;

    @RequiresPermissions("user:view")
    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("userList", userService.findAll());
        return "user/list";
    }

    @RequiresPermissions("user:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        model.addAttribute("user", new User());
        model.addAttribute("op", "新增");
        return "user/edit";
    }


    @RequiresPermissions("user:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(User user, RedirectAttributes redirectAttributes) {
        userService.createUser(user);
        redirectAttributes.addFlashAttribute("msg", "新增成功");
        return "redirect:/user";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("user", userService.findOne(id));
        model.addAttribute("op", "修改");
        return "user/edit";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String update(User user, RedirectAttributes redirectAttributes) {
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("msg", "修改成功");
        return "redirect:/user";
    }

    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.GET)
    public String showDeleteForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("user", userService.findOne(id));
        model.addAttribute("op", "删除");
        return "redirect:/user";
    }

    /**
     * <p>@Description: 删除用户
     * <p>@Author: hupj
     * <p>@Date: 2017/5/22
     * <p>@Param: 
     * <p>@return: BaseResponse 0: 成功 -1：失败
     */
    @ResponseBody
    @RequiresPermissions("user:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        logger.info("========删除用户 {}",id);
        userService.deleteUser(id);
        return new BaseResponse("0","用户删除删除成功！");
    }


    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/changePassword", method = RequestMethod.GET)
    public String showChangePasswordForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", userService.findOne(id));
        model.addAttribute("op", "修改密码");
        return "user/changePassword";
    }

    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/changePassword", method = RequestMethod.POST)
    public String changePassword(@PathVariable("id") Long id, String newPassword, RedirectAttributes redirectAttributes) {
        userService.changePassword(id, newPassword);
        redirectAttributes.addFlashAttribute("msg", "修改密码成功");
        return "redirect:/user";
    }

    /**
     * <p>@Description:  重置密码
     * <p>@Author: hupj
     * <p>@Date: 2017/9/22
     * <p>@Param: 
     * <p>@return:
     */
    @ResponseBody
    @RequiresPermissions("user:resetPassword")
    @RequestMapping(value = "/{id}/resetPassword", method = RequestMethod.POST)
    public BaseResponse resetPassword(@PathVariable("id") Long id) {
        userService.resetPassword(id);
        return new BaseResponse("0","密码重置成功");
    }


    private void setCommonData(Model model) {
        model.addAttribute("organizationList", organizationService.findAll());
        model.addAttribute("roleList", roleService.findAll());
    }
}
