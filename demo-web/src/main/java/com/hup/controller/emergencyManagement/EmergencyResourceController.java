package com.hup.controller.emergencyManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.emergency.EmergencyMaterialPointService;
import com.hup.entity.emergency.EmergencyResourcePoint;
import com.hup.response.BaseResponse;
import com.hup.response.EmergencyResponse;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

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

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmergencyMaterialPointService emergencyMaterialPointService;



    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String emergencyResourceList(){
        return "/emergencyManagement/emergencyResourceList";
    }

    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST)
    public BaseResponse emergencyResourceList(String type){
        logger.info("获取数据 --- type： " + type);
        String desc = null;
        List<EmergencyResponse> list = new ArrayList<>();

        if (StringUtils.isBlank(type)){
            return new BaseResponse("0", null);
        }
        //设备物资点
        if (type.contains("0")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("Material");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }
        //救援队伍
        if (type.contains("1")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("Team");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }
        //专家资源
        if (type.contains("2")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("zj");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }
        //通信资源
        if (type.contains("3")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("Communication");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }
        //运输资源
        if (type.contains("4")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("Transportation");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }

        //医疗资源
        if (type.contains("5")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("Medical");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }

        //避难所
        if (type.contains("6")){
            List<EmergencyResourcePoint> all = emergencyMaterialPointService.findPointByType("RefugePlace");
            for (EmergencyResourcePoint materialPoint : all) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }
        JSONArray jsonArray = JSONArray.fromObject(JSON.toJSONString(list));
        //转成String类型，这里要解释，虽然后面的param的type是json，但是并不影响实际参数是字符串
        //System.out.println("jsonArray.toString() = " + jsonArray.toString());
        return new BaseResponse("0", desc, jsonArray.toString());
    }


}
