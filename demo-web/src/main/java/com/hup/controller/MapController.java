package com.hup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by nt on 2016/4/12.
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/map")
public class MapController {

    @RequestMapping("/monitoring")
    public String monitoringView(){
        return "map/vector_map";
    }

    @RequestMapping("/typhoon")
    public String typhoonView(){
        return "map/typhoon_full_map";
    }

    @ResponseBody
    @RequestMapping(value = "/mapJson",method = RequestMethod.GET)
    public String mapJson(){
        String json ="[116.417, 39.909],[116.417, 39.919],[116.415, 39.913],[116.412, 39.921],[116.410, 39.915],[116.408, 39.920],[116.412, 39.912],[116.413, 39.915]";
        return json;
    }


}
