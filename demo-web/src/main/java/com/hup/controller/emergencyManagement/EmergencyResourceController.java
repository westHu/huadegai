package com.hup.controller.emergencyManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by nt on 2016/4/12.
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/emergencyResource")
public class EmergencyResourceController {


    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String test1(){
        return "/emergencyManagement/emergencyResourceList";
    }


}
