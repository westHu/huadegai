package com.hup.controller.DeviceManagement;

import com.hup.api.deviceManagement.DeviceScrapService;
import com.hup.db.Pager;
import com.hup.entity.DeviceScrap;
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
 * Description: 报废
 * User: west_
 * Date: 2017-09-24
 * Time: 13:28
 */
@Controller
@RequestMapping("/device/scrap")
public class DeviceScrapController {

    Logger logger = LoggerFactory.getLogger(DeviceScrapController.class);

    @Autowired
    private DeviceScrapService deviceScrapService;


//    @RequiresPermissions("scrap:insert")
    @RequestMapping(method = RequestMethod.GET)
    public String showScrapPage(DeviceScrap deviceScrap, PageRequest pageRequest, Model model) {
        logger.info("----------> 报废单列表");
        Pager<DeviceScrap> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = deviceScrapService.queryDeviceScrapList(pager, deviceScrap);
        model.addAttribute("pager", pager);
        model.addAttribute("op", "列表");
        return "deviceManagement/deviceScrapList";
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
    public String scrapCreateForm(Model model) {
        logger.info("--------->报废单页面--");
        /*List<DevicePurchase> devicePurchaseByStatus = devicePurchaseService.getDevicePurchaseByStatus("采购完成");
        List<DevicePurchaseDetail> purchaseDetailList = new ArrayList<>();
        for (DevicePurchase purchase : devicePurchaseByStatus) {
            purchaseDetailList.addAll(purchase.getDevicePurchaseDetailList());
        }
        model.addAttribute("purchaseDetailList", purchaseDetailList);*/
        model.addAttribute("deviceScrap", new DeviceScrap());
        model.addAttribute("op","新增");
        return "deviceManagement/deviceScrapCreate";
    }


    //@RequiresPermissions("scrap:insert")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String scrapCreate(DeviceScrap deviceScrap,  RedirectAttributes redirectAttributes) {
        logger.info("----------> 设备报废单操作--");
        deviceScrap.setScrapCode(DeviceManagementUtil.scrapCode());
        /*for (DeviceScrapDetail scrapDetail : deviceScrap.getDeviceScrapDetailList()) {
            scrapDetail.setDeviceCode(DeviceManagementUtil.deviceCode());
        }*/
        deviceScrapService.insertDeviceScrap(deviceScrap);
        redirectAttributes.addFlashAttribute("msg", "新增报废单成功！");
        return "redirect:/device/scrap";
    }


    /**
     * <p>@Description:
     * <p>@Author: hupj
     * <p>@Date: 2017/10/4
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/view", method = RequestMethod.GET)
    public String deviceScrapView(@PathVariable("id") Long id, Model model) {
        logger.info("========查看采购单=========" + id);
        DeviceScrap deviceScrap = deviceScrapService.findOne(id);
        model.addAttribute("deviceScrap",deviceScrap);
        return "deviceManagement/deviceScrapView";
    }

    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/update", method = RequestMethod.GET)
    public String deviceScrapUpdate(@PathVariable("id") Long id, Model model) {
        logger.info("========更新采购单=========" + id);
        DeviceScrap deviceScrap = deviceScrapService.findOne(id);
        model.addAttribute("deviceScrap",deviceScrap);
        model.addAttribute("op","更新");
        return "deviceManagement/deviceScrapCreate";
    }


    /**
     * <p>@Description: 更新页面
     * <p>@Author: hupj
     * <p>@Date: 2017/9/25
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String deviceScrapUpdate(DeviceScrap deviceScrap, RedirectAttributes redirectAttributes) {
        deviceScrapService.updateDeviceScrap(deviceScrap);
        redirectAttributes.addFlashAttribute("msg","报废单更新成功！");
        return "redirect:/device/scrap";
    }


    /**
     * <p>@Description: 删除报废单
     * <p>@Author: hupj
     * <p>@Date: 2017/9/26
     * <p>@Param:
     * <p>@return:
     */
    //@RequiresPermissions("device:delete")
    @ResponseBody
    @RequestMapping(value = "/{id}/delete", method = RequestMethod.POST)
    public BaseResponse delete(@PathVariable("id") Long id) {
        logger.info("========删除报废单： {}",id);
        deviceScrapService.deleteDeviceScrap(id);
        return new BaseResponse("0","采购单删除成功！");
    }



}
