package com.hup.controller;

import com.hup.api.ResourceService;
import com.hup.api.RoleService;
import com.hup.entity.Resource;
import com.hup.entity.Role;
import com.hup.response.BaseResponse;
import com.hup.response.RoleTreeResponse;
import org.apache.commons.lang.StringUtils;
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

import java.util.ArrayList;
import java.util.List;

/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Autowired
    private RoleService roleService;

    @Autowired
    private ResourceService resourceService;

    @RequiresPermissions("role:view")
    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("roleList", roleService.findAll());
        return "role/roleList";
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String showCreateForm(Model model) {
        setCommonData(model);
        setResourceMap(model);
        model.addAttribute("role", new Role());
        model.addAttribute("op", "新增");
        return "role/roleEdit";
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(Role role, RedirectAttributes redirectAttributes) {
        setRoleIds(role);
        String resourceIdsStr = role.getResourceIdsStr();
        System.out.println("resourceIdsStr "  + resourceIdsStr);
        roleService.createRole(role);
        redirectAttributes.addFlashAttribute("msg", "新增成功");
        return "redirect:/role";
    }

    @RequiresPermissions("role:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        setCommonData(model);
        model.addAttribute("role", roleService.findOne(id));
        model.addAttribute("op", "修改");
        return "role/roleEdit";
    }

    @RequiresPermissions("role:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String update(Role role, RedirectAttributes redirectAttributes) {
        roleService.updateRole(role);
        redirectAttributes.addFlashAttribute("msg", "修改成功");
        return "redirect:/role";
    }
    


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/9/23
     * <p>@Param:
     * <p>@return:
     */
    @ResponseBody
    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        roleService.deleteRole(id);
        return  new BaseResponse("0","角色删除成功！");
    }

    private void setCommonData(Model model) {
        model.addAttribute("resourceList", resourceService.findAll());
    }


    private void setResourceMap(Model model){
        Resource root = null;
        List<Resource> resourceList = resourceService.findAll();
        for (Resource resource : resourceList){
            if (resource.isRootNode()){
                root = resource;
            }
        }

        List<RoleTreeResponse> responseList = new ArrayList<>();
        for (Resource resource : resourceList){
            RoleTreeResponse response = new RoleTreeResponse();
            if (resource.getParentId().equals(root.getId())){
                List<String> son = new ArrayList<>();
                for (Resource obj : resourceList){
                    if (obj.getParentId().equals(resource.getId())){
                        son.add( obj.getId() + "*   " +obj.getName());
                    }
                }
                response.setName("["+resource.getId()+"] " + resource.getName());
                response.setSonResourceList(son);
                responseList.add(response);
            }
        }
        model.addAttribute("resourceTreeList", responseList);
    }


    private void setRoleIds(Role role){
        //格式转化， 前端和后端格式不一致 13* 组织机构修改,14* 组织机构删除,23* 用户修改,24* 用户删除,25* 用户查看,32* 资源新增,33* 资源修改
        String roleNames = role.getResourceNames();
        if (StringUtils.isBlank(roleNames)) return;

        String[] splitDH = roleNames.split(",");
        List<Long> ids = new ArrayList<>();
        if (splitDH != null && splitDH.length > 0){
            for (String param : splitDH){
                String id = param.split("\\*")[0];
                if (StringUtils.isNotBlank(id)) {
                    ids.add(Long.parseLong(id));
                }
            }
        }
        role.setResourceIds(ids);
    }

}
