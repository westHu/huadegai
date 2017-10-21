package com.hup.controller;

import com.hup.api.OrganizationService;
import com.hup.api.RoleService;
import com.hup.api.UserService;
import com.hup.constant.CantDelete;
import com.hup.db.Pager;
import com.hup.entity.User;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.PageUtils;
import com.hup.util.encrypt.Base64Utils;
import org.apache.commons.lang3.StringUtils;
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
import java.util.Arrays;

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


    /**
     * <p>@Description: 用户列表
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @RequiresPermissions("user:view")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(String msg, User user, PageRequest pageRequest, Model model) {
        logger.info("-----> 用户列表页面");
        Pager<User> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = userService.queryUserList(user, pager);
        model.addAttribute("pager", pager);
        if (StringUtils.isNotBlank(msg)) {
            String decode = Base64Utils.decodeStr(msg);
            model.addAttribute("msg", decode);
        }
        model.addAttribute("flag", "系统设置,用户管理");
        return "user/userList";
    }


    /**
     * <p>@Description:  跳转用户新增页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @RequiresPermissions("user:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(User user, Model model) {
        logger.info("-----> 创建用户页面");
        setCommonData(model);
        model.addAttribute("organizationTree", organizationService.getOrganizationTree());
        if (null == user) {
            user = new User();
        }
        model.addAttribute("user", user);
        model.addAttribute("op", "新增");
        return "user/userCreate";
    }


    /**
     * <p>@Description:  用户新增操作
     *                 对于用户名、邮箱、电话不能重复，此处用 set来实现， 对于用户量比较小的简单实用
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @RequiresPermissions("user:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(User user, RedirectAttributes redirectAttributes) {
        //用户名不能重复
        User byUsername = userService.findByUsername(user.getUsername());
        if (null != byUsername){
            user.setUsername(null);
            redirectAttributes.addFlashAttribute("user", user);
            redirectAttributes.addFlashAttribute("msg", user.getUsername() + ", 该用户名已经存在，新增用户失败！");
            return "redirect:/user/create";
        }
        userService.createUser(user);
        redirectAttributes.addFlashAttribute("msg", "新增成功");
        return "redirect:/user/list";
    }


    /**
     * <p>@Description: 跳转到用户编辑页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("organizationTree", organizationService.getOrganizationTree());
        model.addAttribute("user", userService.findOne(id));
        model.addAttribute("op", "更新");
        return "user/userCreate";
    }


    /**
     * <p>@Description: 用户更新
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @RequiresPermissions("user:update")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(User user,  RedirectAttributes redirectAttributes) {
        userService.updateUser(user);
        redirectAttributes.addFlashAttribute("msg", "修改成功");
        return "redirect:/user/list";
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
        logger.info("========删除用户 {} ========",id);
        User user = userService.findOne(id);
        String[] split = CantDelete.INNATE_USER.split(",");
        if (null != user && Arrays.asList(split).contains(user.getUsername()) ){
            return new BaseResponse("-1",user.getUsername()+",该用户是固有用户，不能删除！");
        }
        userService.deleteUser(id);
        return new BaseResponse("0","用户删除删除成功！");
    }


    /**
     * <p>@Description:  跳转用户修改密码页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
    @RequiresPermissions("user:update")
    @RequestMapping(value = "/{id}/changePassword", method = RequestMethod.GET)
    public String showChangePasswordForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("user", userService.findOne(id));
        model.addAttribute("op", "修改密码");
        return "user/changePassword";
    }


    /**
     * <p>@Description: 用户修改密码
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
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
