package com.hup.controller;

import com.alibaba.fastjson.JSON;
import com.hup.api.ResourceService;
import com.hup.entity.Resource;
import com.hup.response.BaseResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Controller
@RequestMapping("/resource")
public class ResourceController {

    Logger logger = LoggerFactory.getLogger(ResourceController.class);

    @Autowired
    private ResourceService resourceService;

    @ModelAttribute("types")
    public Resource.ResourceType[] resourceTypes() {
        return Resource.ResourceType.values();
    }

    @RequiresPermissions("resource:view")
    @RequestMapping(method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("resourceList", resourceService.findAll());
        return "resource/list";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.GET)
    public String showAppendChildForm(@PathVariable("parentId") Long parentId, Model model) {
        Resource parent = resourceService.findOne(parentId);
        model.addAttribute("parent", parent);
        Resource child = new Resource();
        child.setParentId(parentId);
        child.setParentIds(parent.makeSelfAsParentIds());
        model.addAttribute("resource", child);
        model.addAttribute("op", "新增子节点");
        return "resource/edit";
    }

    @RequiresPermissions("resource:create")
    @RequestMapping(value = "/{parentId}/appendChild", method = RequestMethod.POST)
    public String create(Resource resource, RedirectAttributes redirectAttributes) {
        logger.info("========= 添加子节点 =========");
        resourceService.createResource(resource);
        redirectAttributes.addFlashAttribute("msg", "新增子节点成功");
        return "redirect:/resource";
    }

    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String showUpdateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("resource", resourceService.findOne(id));
        model.addAttribute("op", "修改");
        return "resource/edit";
    }

    @RequiresPermissions("resource:update")
    @RequestMapping(value = "/{id}/update", method = RequestMethod.POST)
    public String update(Resource resource, RedirectAttributes redirectAttributes) {
        resourceService.updateResource(resource);
        redirectAttributes.addFlashAttribute("msg", "修改成功");
        return "redirect:/resource";
    }

    /**
     * <p>@Description:  删除资源
     * <p>@Author: hupj
     * <p>@Date: 2017/9/24
     * <p>@Param: 
     * <p>@return:
     */
    @ResponseBody
    @RequiresPermissions("resource:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        resourceService.deleteResource(id);
        return new BaseResponse("0", "资源删除成功！");
    }


}
