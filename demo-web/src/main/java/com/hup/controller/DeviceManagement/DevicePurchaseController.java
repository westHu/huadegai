package com.hup.controller.DeviceManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.UserService;
import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.api.flow.ProcessDefinitionService;
import com.hup.api.flow.ProcessRuntimeService;
import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.ProcessDefinition;
import com.hup.entity.ProcessRuntime;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.DeviceManagementUtil;
import com.hup.util.PageUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
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

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 13:28
 */
@Controller
@RequestMapping("/device/purchase")
public class DevicePurchaseController {

    Logger logger = LoggerFactory.getLogger(DevicePurchaseController.class);

    @Autowired
    private DevicePurchaseService devicePurchaseService;

    @Autowired
    private UserService userService;


//    @RequiresPermissions("purchase:insert")
    @RequestMapping(method = RequestMethod.GET)
    public String showInboundPage(DevicePurchase devicePurchase, PageRequest pageRequest, Model model) {
        logger.info("----------> 设备采购单列表");
        Pager<DevicePurchase> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = devicePurchaseService.queryDevicePurchaseList(pager, devicePurchase);
        model.addAttribute("page", pager);
        model.addAttribute("op", "列表");

        String name = (String) SecurityUtils.getSubject().getPrincipal();
        String leaders = userService.findLeaders(name);
        model.addAttribute("canAuditors", leaders+","+name);
        return "deviceManagement/devicePurchaseList";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("purchase:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String purchaseCreateForm(Model model) {
        logger.info("--------->跳转至采购单页面--");
        model.addAttribute("devicePurchase", new DevicePurchase());
        model.addAttribute("op","新增");
        return "deviceManagement/devicePurchaseCreate";
    }


    //@RequiresPermissions("purchase:insert")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String purchaseCreate(DevicePurchase devicePurchase,  RedirectAttributes redirectAttributes) {
        logger.info("----------> 设备采购单操作-- " + JSON.toJSONString(devicePurchase));
        devicePurchase.setPurchaseCode(DeviceManagementUtil.purchaseCode());
        devicePurchaseService.insertDevicePurchase(devicePurchase);
        redirectAttributes.addFlashAttribute("msg", "新增采购单成功！");
        return "redirect:/device/purchase";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/10/4
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/view", method = RequestMethod.GET)
    public String devicePurchaseView(@PathVariable("id") Long id, Model model) {
        logger.info("========查看采购单=========" + id);
        DevicePurchase devicePurchase = devicePurchaseService.findOne(id);
        model.addAttribute("devicePurchase",devicePurchase);
        return "deviceManagement/devicePurchaseView";
    }

    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String devicePurchaseUpdate(@PathVariable("id") Long id, Model model) {
        logger.info("========更新采购单=========" + id);
        DevicePurchase devicePurchase = devicePurchaseService.findOne(id);
        model.addAttribute("devicePurchase",devicePurchase);
        model.addAttribute("op","更新");
        return "deviceManagement/devicePurchaseCreate";
    }


    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String devicePurchaseUpdate(DevicePurchase devicePurchase, RedirectAttributes redirectAttributes) {
        devicePurchaseService.updateDevicePurchase(devicePurchase);
        redirectAttributes.addFlashAttribute("msg","采购单更新成功！");
        return "redirect:/device/purchase";
    }


    /**
     * <p>@Description: 删除采购单
     * <p>@Author: hupj
     * <p>@Date: 2017/9/26
     * <p>@Param:
     * <p>@return:
     */
    //@RequiresPermissions("device:delete")
    @ResponseBody
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        logger.info("========删除采购单： {}",id);
        devicePurchaseService.deleteDevicePurchase(id);
        return new BaseResponse("0","采购单删除成功！");
    }


    /**
     * <p>@Description:审核采购单
     * <p>@Author: hupj
     * <p>@Date: 2017/10/10
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{code}/audit", method = RequestMethod.GET)
    public String audit(@PathVariable("code") String code, ProcessRuntime processRuntime) {
        logger.info("========审核采购单 code ：{}",code);
        Boolean audit = devicePurchaseService.auditProcess(code, processRuntime);
        return "redirect:/device/purchase";
    }




}
