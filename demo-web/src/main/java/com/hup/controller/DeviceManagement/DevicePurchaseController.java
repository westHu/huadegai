package com.hup.controller.DeviceManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.deviceManagement.DevicePurchaseService;
import com.hup.api.deviceManagement.DeviceService;
import com.hup.db.Pager;
import com.hup.entity.Device;
import com.hup.entity.DevicePurchase;
import com.hup.entity.DevicePurchaseDetail;
import com.hup.enums.DeviceEnum;
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

        return "deviceManagement/devicePurchaseList";
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
    public String purchaseCreateForm(Model model) {
        logger.info("--------->采购单页面--");
        model.addAttribute("purchase", new DevicePurchase());
        model.addAttribute("op","新增");
        return "deviceManagement/devicePurchaseCreate";
    }


    //@RequiresPermissions("purchase:insert")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String purchaseCreate(DevicePurchase devicePurchase,  RedirectAttributes redirectAttributes) {
        logger.info("----------> 设备采购单操作--");
        devicePurchaseService.insertDevicePurchase(devicePurchase);
        redirectAttributes.addFlashAttribute("msg", "新增采购单成功！");
        return "redirect:/device/purchase";
    }



    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    //@RequiresPermissions("device:update")
    /*@RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String  deviceObj(@PathVariable("id") Long id, PageRequest pageRequest, Model model) {
        logger.info("====== 获取Device：{} for update ======",id);
        Device device = deviceService.findOne(id);
        model.addAttribute("device", device);
        model.addAttribute("deviceBgType", DeviceEnum.DeviceBgType.values());
        model.addAttribute("deviceSmType", DeviceEnum.DeviceSmType.values());
        model.addAttribute("deviceStatus", DeviceEnum.DeviceStatus.values());

        Pager<Device> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = deviceService.queryDeviceList(pager, device);
        //model.addAttribute("request", device);
        model.addAttribute("page", pager);
        model.addAttribute("op", "更新");

        return "deviceManagement/inbound";
    }*/


    /*@RequestMapping(value = "/update", method = RequestMethod.POST)
    public String deviceUpdate(Device device, Model model) {
        logger.info("========设备更新=========" + JSON.toJSONString(device));
        deviceService.update(device);
        model.addAttribute("msg","设备更新成功！");
        return "redirect:/device/inbound";
    }*/



    /**
     * <p>@Description: 删除设备
     * <p>@Author: hupj
     * <p>@Date: 2017/9/26
     * <p>@Param:
     * <p>@return:
     */
    /*@ResponseBody
//    @RequiresPermissions("device:delete")
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        logger.info("========删除用户 {}",id);
        deviceService.deleteDevice(id);
        return new BaseResponse("0","设备删除成功！");
    }*/

}
