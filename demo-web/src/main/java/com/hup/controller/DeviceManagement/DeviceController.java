package com.hup.controller.DeviceManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.deviceManagement.DeviceService;
import com.hup.db.Pager;
import com.hup.entity.Device;
import com.hup.enums.DeviceEnum;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.DeviceManagementUtil;
import com.hup.util.PageUtils;
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

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-09-24
 * Time: 13:28
 */
@Controller
@RequestMapping("/device")
public class DeviceController {

    Logger logger = LoggerFactory.getLogger(DeviceController.class);

    @Autowired
    private DeviceService deviceService;


//    @RequiresPermissions("device:insert")
    /*@RequestMapping(value = "/inbound",method = RequestMethod.GET)
    public String showInboundPage(Device device, PageRequest pageRequest, Model model) {
        logger.info("========设备入库页面=========");
        model.addAttribute("device", new Device());
        model.addAttribute("deviceBgType", DeviceEnum.DeviceBgType.values());
        model.addAttribute("deviceSmType", DeviceEnum.DeviceSmType.values());
        model.addAttribute("deviceStatus", DeviceEnum.DeviceStatus.values());

        Pager<Device> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = deviceService.queryDeviceList(pager, device);
        //model.addAttribute("request", device);
        model.addAttribute("page", pager);
        model.addAttribute("op", "新增");

        return "deviceManagement/inbound";
    }*/


    /**
     * <p>@Description:  http://www.cnblogs.com/ssslinppp/p/7100762.html?utm_source=itdadao&utm_medium=referral
     * 前端string 到后台无法转枚举
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("device:create")
    /*@RequestMapping(value = "/inbound", method = RequestMethod.POST)
    public String inbound(Device device, Model model) {
        logger.info("========设备入库=========" + JSON.toJSONString(device));
        device.setDeviceCode(DeviceManagementUtil.deviceCode());
        device.setDeviceStatus(DeviceEnum.DeviceStatus.IN_HOUSE);
        deviceService.insert(device);
        model.addAttribute("msg","设备添加成功！");
        return "redirect:/device/inbound";
    }*/


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
