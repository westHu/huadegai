package com.hup.controller.DeviceManagement;

import com.hup.api.deviceManagement.DeviceInstallService;
import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.db.Pager;
import com.hup.entity.*;
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
@RequestMapping("/device/install")
public class DeviceInstallController {

    Logger logger = LoggerFactory.getLogger(DeviceInstallController.class);

    @Autowired
    private DeviceInstallService deviceInstallService;




//    @RequiresPermissions("install:insert")
    @RequestMapping(method = RequestMethod.GET)
    public String showInstallPage(DeviceInstall deviceInstall, PageRequest pageRequest, Model model) {
        logger.info("----------> 设备安装单列表");
        Pager<DeviceInstall> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = deviceInstallService.queryDeviceInstallList(pager, deviceInstall);
        model.addAttribute("pager", pager);
        model.addAttribute("op", "列表");
        return "deviceManagement/deviceInstallList";
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
    public String installCreateForm(Model model) {
        logger.info("--------->安装单页面--");
        /*List<DevicePurchase> devicePurchaseByStatus = devicePurchaseService.getDevicePurchaseByStatus("采购完成");
        List<DevicePurchaseDetail> purchaseDetailList = new ArrayList<>();
        for (DevicePurchase purchase : devicePurchaseByStatus) {
            purchaseDetailList.addAll(purchase.getDevicePurchaseDetailList());
        }
        model.addAttribute("purchaseDetailList", purchaseDetailList);*/
        model.addAttribute("deviceInstall", new DeviceInstall());
        model.addAttribute("op","新增");
        return "deviceManagement/deviceInstallCreate";
    }


    //@RequiresPermissions("install:insert")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String installCreate(DeviceInstall deviceInstall,  RedirectAttributes redirectAttributes) {
        logger.info("----------> 设备采购单操作--");
        deviceInstall.setInstallCode(DeviceManagementUtil.installCode());
        for (DeviceInstallDetail installDetail : deviceInstall.getDeviceInstallDetailList()) {
            installDetail.setDeviceCode(DeviceManagementUtil.deviceCode());
        }
        deviceInstallService.insertDeviceInstall(deviceInstall);
        redirectAttributes.addFlashAttribute("msg", "新增采购单成功！");
        return "redirect:/device/install";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/10/4
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/view", method = RequestMethod.GET)
    public String deviceInstallView(@PathVariable("id") Long id, Model model) {
        logger.info("========查看采购单=========" + id);
        DeviceInstall deviceInstall = deviceInstallService.findOne(id);
        model.addAttribute("deviceInstall",deviceInstall);
        return "deviceManagement/deviceInstallView";
    }

    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String deviceInstallUpdate(@PathVariable("id") Long id, Model model) {
        logger.info("========更新采购单=========" + id);
        DeviceInstall deviceInstall = deviceInstallService.findOne(id);
        model.addAttribute("deviceInstall",deviceInstall);
        model.addAttribute("op","更新");
        return "deviceManagement/deviceInstallCreate";
    }


    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String deviceInstallUpdate(DeviceInstall deviceInstall, RedirectAttributes redirectAttributes) {
        deviceInstallService.updateDeviceInstall(deviceInstall);
        redirectAttributes.addFlashAttribute("msg","采购单更新成功！");
        return "redirect:/device/install";
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
        logger.info("========删除安装单： {}",id);
        deviceInstallService.deleteDeviceInstall(id);
        return new BaseResponse("0","采购单删除成功！");
    }



}
