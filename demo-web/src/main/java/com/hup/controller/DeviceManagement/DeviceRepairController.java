package com.hup.controller.DeviceManagement;

import com.hup.api.deviceManagement.DeviceRepairService;
import com.hup.db.Pager;
import com.hup.entity.DeviceRepair;
import com.hup.entity.DeviceRepairDetail;
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

/**
 * Created with IntelliJ IDEA.
 * Description: 入库
 * User: west_
 * Date: 2017-09-24
 * Time: 13:28
 */
@Controller
@RequestMapping("/device/repair")
public class DeviceRepairController {

    Logger logger = LoggerFactory.getLogger(DeviceRepairController.class);

    @Autowired
    private DeviceRepairService deviceRepairService;




//    @RequiresPermissions("repair:insert")
    @RequestMapping(method = RequestMethod.GET)
    public String showRepairPage(DeviceRepair deviceRepair, PageRequest pageRequest, Model model) {
        logger.info("----------> 维修单列表");
        Pager<DeviceRepair> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = deviceRepairService.queryDeviceRepairList(pager, deviceRepair);
        model.addAttribute("pager", pager);
        model.addAttribute("op", "列表");
        return "deviceManagement/deviceRepairList";
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
    public String repairCreateForm(Model model) {
        logger.info("--------->维修单页面--");
        /*List<DevicePurchase> devicePurchaseByStatus = devicePurchaseService.getDevicePurchaseByStatus("采购完成");
        List<DevicePurchaseDetail> purchaseDetailList = new ArrayList<>();
        for (DevicePurchase purchase : devicePurchaseByStatus) {
            purchaseDetailList.addAll(purchase.getDevicePurchaseDetailList());
        }
        model.addAttribute("purchaseDetailList", purchaseDetailList);*/
        model.addAttribute("deviceRepair", new DeviceRepair());
        model.addAttribute("op","新增");
        return "deviceManagement/deviceRepairCreate";
    }


    //@RequiresPermissions("repair:insert")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String repairCreate(DeviceRepair deviceRepair,  RedirectAttributes redirectAttributes) {
        logger.info("----------> 设备维修单操作--");
        deviceRepair.setRepairCode(DeviceManagementUtil.repairCode());
        for (DeviceRepairDetail repairDetail : deviceRepair.getDeviceRepairDetailList()) {
            repairDetail.setDeviceCode(DeviceManagementUtil.deviceCode());
        }
        deviceRepairService.insertDeviceRepair(deviceRepair);
        redirectAttributes.addFlashAttribute("msg", "新增维修单成功！");
        return "redirect:/device/repair";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/10/4
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/view", method = RequestMethod.GET)
    public String deviceRepairView(@PathVariable("id") Long id, Model model) {
        logger.info("========查看采购单=========" + id);
        DeviceRepair deviceRepair = deviceRepairService.findOne(id);
        model.addAttribute("deviceRepair",deviceRepair);
        return "deviceManagement/deviceRepairView";
    }

    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String deviceRepairUpdate(@PathVariable("id") Long id, Model model) {
        logger.info("========更新采购单=========" + id);
        DeviceRepair deviceRepair = deviceRepairService.findOne(id);
        model.addAttribute("deviceRepair",deviceRepair);
        model.addAttribute("op","更新");
        return "deviceManagement/deviceRepairCreate";
    }


    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String deviceRepairUpdate(DeviceRepair deviceRepair, RedirectAttributes redirectAttributes) {
        deviceRepairService.updateDeviceRepair(deviceRepair);
        redirectAttributes.addFlashAttribute("msg","维修单更新成功！");
        return "redirect:/device/repair";
    }


    /**
     * <p>@Description: 删除维修单
     * <p>@Author: hupj
     * <p>@Date: 2017/9/26
     * <p>@Param:
     * <p>@return:
     */
    //@RequiresPermissions("device:delete")
    @ResponseBody
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        logger.info("========删除维修单： {}",id);
        deviceRepairService.deleteDeviceRepair(id);
        return new BaseResponse("0","采购单删除成功！");
    }



}
