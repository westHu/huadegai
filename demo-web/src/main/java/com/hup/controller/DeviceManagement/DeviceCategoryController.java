package com.hup.controller.DeviceManagement;

import com.hup.api.deviceManagement.DeviceCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created with IntelliJ IDEA.
 * Description: 设备分类树
 * User: west_
 * Date: 2017-10-03
 * Time: 20:21
 */
@Controller
@RequestMapping("/device/category")
public class DeviceCategoryController {

    @Autowired
    private DeviceCategoryService deviceCategoryService;

    
    /**
     * <p>@Description: 
     * <p>@Author: hupj
     * <p>@Date: 2017/10/3
     * <p>@Param: 
     * <p>@return:
     */
    @RequestMapping(method = RequestMethod.GET)
    public String DeviceCategoryTree(Model model){
        String deviceCategoryTree = deviceCategoryService.getDeviceCategoryTree();
        model.addAttribute("deviceCategoryTree", deviceCategoryTree);
        return "deviceManagement/deviceCategory";
    }


}
