package com.hup.controller.emergencyManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.emergency.EmergencyResourceDetailService;
import com.hup.api.emergency.EmergencyResourcePointService;
import com.hup.db.Pager;
import com.hup.entity.User;
import com.hup.entity.emergency.EmergencyResourceDetail;
import com.hup.entity.emergency.EmergencyResourcePoint;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.response.DataGridResponse;
import com.hup.response.EmergencyResponse;
import com.hup.util.PageUtils;
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
    private EmergencyResourcePointService pointService;

    @Autowired
    private EmergencyResourceDetailService detailService;



    @RequestMapping(value = "/pointList", method = RequestMethod.GET)
    public String emergencyResourceList(){
        return "/emergencyManagement/emergencyResourceList";
    }

    @ResponseBody
    @RequestMapping(value = "/pointListByType", method = RequestMethod.GET)
    public DataGridResponse pointListByType(String types, PageRequest pageRequest){
        if (StringUtils.isBlank(types)) {
            return new DataGridResponse();
        }
        String[] split = types.split(",");
        Pager<EmergencyResourcePoint> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getRows()));
        EmergencyResourcePoint resourcePoint = new EmergencyResourcePoint();
        resourcePoint.setTypes(split);
        pager = pointService.queryPointListByType(resourcePoint, pager);
        List<EmergencyResourcePoint> pointList = new ArrayList<>();
        for (EmergencyResourcePoint point : pager.getList()){
            String type;
            switch(point.getType()){
                case "Material":        type = "急救设备物资"; break;
                case "Team":            type = "急救队伍资源"; break;
                case "Communication":   type = "急救通信资源"; break;
                case "Medical":         type = "急救医疗资源"; break;
                case "Transportation":  type = "急救运输资源"; break;
                case "RefugePlace" :    type = "急救避难所"; break;
                default: type = "急救设备物资";
            }
            point.setType(type);
            pointList.add(point);
        }

        DataGridResponse response = new DataGridResponse(pager.getTotalCount(), pointList);
        return response;
    }


    @ResponseBody
    @RequestMapping(value = "/detailListByPoint", method = RequestMethod.GET)
    public DataGridResponse detailListByPoint(String point, PageRequest pageRequest){
        if (StringUtils.isBlank(point)) {
            return new DataGridResponse();
        }
        Pager<EmergencyResourceDetail> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getRows()));
        EmergencyResourceDetail resourceDetail = new EmergencyResourceDetail();
        resourceDetail.setPointId(Long.parseLong(point));
        pager = detailService.queryDetailListByPoint(resourceDetail, pager);
        DataGridResponse response = new DataGridResponse(pager.getTotalCount(), pager.getList());
        return response;
    }



    @ResponseBody
    @RequestMapping(value = "/pointJson", method = RequestMethod.POST)
    public BaseResponse emergencyResourceList(String types){
        logger.info("获取数据 --- type： " + types);
        String desc = null;
        List<EmergencyResponse> list = new ArrayList<>();

        if (StringUtils.isBlank(types)){
            return new BaseResponse("0", null);
        }
        for (String type : types.split(",")) {
            List<EmergencyResourcePoint> points = pointService.findPointByType(type);
            for (EmergencyResourcePoint materialPoint : points) {
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
