package com.hup.controller.DeviceManagement;

import com.hup.api.deviceManagement.DeviceInboundService;
import com.hup.api.deviceManagement.DeviceInboundService;
import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.db.Pager;
import com.hup.entity.*;
import com.hup.entity.DeviceInbound;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.DeviceManagementUtil;
import com.hup.util.PageUtils;
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
 * Created with IntelliJ IDEA.
 * Description: 入库
 * User: west_
 * Date: 2017-09-24
 * Time: 13:28
 */
@Controller
@RequestMapping("/device/inbound")
public class DeviceInboundController {

    Logger logger = LoggerFactory.getLogger(DeviceInboundController.class);

    @Autowired
    private DeviceInboundService deviceInboundService;

    @Autowired
    private DevicePurchaseService devicePurchaseService;


//    @RequiresPermissions("inbound:insert")
    @RequestMapping(method = RequestMethod.GET)
    public String showInboundPage(DeviceInbound deviceInbound, PageRequest pageRequest, Model model) {
        logger.info("----------> 设备入库单列表");
        Pager<DeviceInbound> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = deviceInboundService.queryDeviceInboundList(pager, deviceInbound);
        model.addAttribute("page", pager);
        model.addAttribute("op", "列表");
        return "deviceManagement/deviceInboundList";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("device:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String inboundCreateForm(Model model) {
        logger.info("--------->入库单页面--");
        List<DevicePurchase> devicePurchaseByStatus = devicePurchaseService.getDevicePurchaseByStatus("采购完成");
        List<DevicePurchaseDetail> purchaseDetailList = new ArrayList<>();
        for (DevicePurchase purchase : devicePurchaseByStatus) {
            purchaseDetailList.addAll(purchase.getDevicePurchaseDetailList());
        }
        model.addAttribute("purchaseDetailList", purchaseDetailList);
        model.addAttribute("deviceInbound", new DeviceInbound());
        model.addAttribute("op","新增");
        return "deviceManagement/deviceInboundCreate";
    }


    //@RequiresPermissions("inbound:insert")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String inboundCreate(DeviceInbound deviceInbound,  RedirectAttributes redirectAttributes) {
        logger.info("----------> 设备采购单操作--");
        deviceInbound.setInboundCode(DeviceManagementUtil.inboundCode());
        for (DeviceInboundDetail inboundDetail : deviceInbound.getDeviceInboundDetailList()) {
            inboundDetail.setDeviceCode(DeviceManagementUtil.deviceCode());
        }
        deviceInboundService.insertDeviceInbound(deviceInbound);
        redirectAttributes.addFlashAttribute("msg", "新增采购单成功！");
        return "redirect:/device/inbound";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/10/4
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/view", method = RequestMethod.GET)
    public String deviceInboundView(@PathVariable("id") Long id, Model model) {
        logger.info("========查看采购单=========" + id);
        DeviceInbound deviceInbound = deviceInboundService.findOne(id);
        model.addAttribute("deviceInbound",deviceInbound);
        return "deviceManagement/deviceInboundView";
    }

    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String deviceInboundUpdate(@PathVariable("id") Long id, Model model) {
        logger.info("========更新采购单=========" + id);
        DeviceInbound deviceInbound = deviceInboundService.findOne(id);
        model.addAttribute("deviceInbound",deviceInbound);
        model.addAttribute("op","更新");
        return "deviceManagement/deviceInboundCreate";
    }


    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String deviceInboundUpdate(DeviceInbound deviceInbound, RedirectAttributes redirectAttributes) {
        deviceInboundService.updateDeviceInbound(deviceInbound);
        redirectAttributes.addFlashAttribute("msg","采购单更新成功！");
        return "redirect:/device/inbound";
    }


    /**
     * <p>@Description: 删除设备
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
        deviceInboundService.deleteDeviceInbound(id);
        return new BaseResponse("0","采购单删除成功！");
    }



}
