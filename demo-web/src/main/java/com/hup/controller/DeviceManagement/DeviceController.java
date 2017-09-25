package com.hup.controller.DeviceManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.deviceManagement.DeviceService;
import com.hup.entity.deviceManagement.Device;
import com.hup.enums.DeviceEnum;
import com.hup.response.BaseResponse;
import com.hup.util.DeviceManagementUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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


//    @RequiresPermissions("device:create")
    @RequestMapping(value = "/inbound", method = RequestMethod.GET)
    public String showInboundPage(Model model) {
        logger.info("========设备入库页面=========");
        model.addAttribute("device", new Device());
        DeviceEnum.DeviceBgType[] values = DeviceEnum.DeviceBgType.values();
        model.addAttribute("deviceBgType", DeviceEnum.DeviceBgType.values());
        model.addAttribute("deviceSmType", DeviceEnum.DeviceSmType.values());
        model.addAttribute("deviceStatus", DeviceEnum.DeviceStatus.values());
        model.addAttribute("op", "新增");

        return "deviceManagement/inbound";
    }

    //http://www.cnblogs.com/ssslinppp/p/7100762.html?utm_source=itdadao&utm_medium=referral
    //前端string 到后台无法转枚举
//    @RequiresPermissions("device:create")
    @RequestMapping(value = "/inbound", method = RequestMethod.POST)
    public String inbound(Device device, Model model) {
        logger.info("========设备入库=========" + JSON.toJSONString(device));
        device.setDeviceCode(DeviceManagementUtil.deviceCode());
        deviceService.insert(device);
        model.addAttribute("msg","设备添加成功！");
        return "redirect:/inbound";
    }


}
