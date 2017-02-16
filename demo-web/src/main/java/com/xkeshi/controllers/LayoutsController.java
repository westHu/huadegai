package com.xkeshi.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by nt on 2016/4/12.
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/layout")
public class LayoutsController {

    @RequestMapping("boxed")
    public String boxed_view(){
        return "layout/boxed_view";
    }

    @RequestMapping("collapsed")
    public String collapsed_view(){
        return "layout/collapsed_view";
    }

    @RequestMapping("horizontal")
    public String horizontal_view(){
        return "layout/horizontal_menu";
    }

}
