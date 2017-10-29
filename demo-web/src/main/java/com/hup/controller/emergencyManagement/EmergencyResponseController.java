package com.hup.controller.emergencyManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.emergency.EmergencyAlarmEventService;
import com.hup.api.emergency.EmergencyResourceDetailService;
import com.hup.api.emergency.EmergencyResourcePointService;
import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyAlarmEvent;
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
import org.springframework.ui.Model;
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
@RequestMapping("/emergencyResponse")
public class EmergencyResponseController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmergencyAlarmEventService alarmEventService;


    @RequestMapping(value = "/responseList", method = RequestMethod.GET)
    public String emergencyResponseList(Model model){
        //上报的事件List
        List<EmergencyAlarmEvent> eventList = alarmEventService.findAlarmEventListByStatus("上报");
        model.addAttribute("eventList", JSONArray.fromObject(eventList).toString());
        return "/emergencyManagement/emergencyResponseList";
    }


    @ResponseBody
    @RequestMapping(value = "/alarmEventList", method = RequestMethod.GET)
    public DataGridResponse alarmEventList(EmergencyAlarmEvent alarmEvent, PageRequest pageRequest){
        Pager<EmergencyAlarmEvent> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getRows()));
        pager = alarmEventService.queryAlarmEventList(alarmEvent, pager);
        DataGridResponse response = new DataGridResponse(pager.getTotalCount(), pager.getList());
        return response;
    }





}
