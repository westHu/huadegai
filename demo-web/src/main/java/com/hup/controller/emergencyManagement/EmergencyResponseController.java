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
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.Date;
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

    @Autowired
    private EmergencyResourcePointService pointService;


    @RequestMapping(value = "/responseList", method = RequestMethod.GET)
    public String emergencyResponseList(Model model){
        //上报的事件List
        List<EmergencyAlarmEvent> eventList = alarmEventService.findAlarmEventListByStatus("上报");
        model.addAttribute("eventList", JSONArray.fromObject(eventList).toString());

        List<EmergencyResourcePoint> pointList = pointService.getAll();
        model.addAttribute("pointList", JSONArray.fromObject(pointList).toString());

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


    @RequestMapping(value = "/alarmEvent/create", method = RequestMethod.POST)
    public String alarmEventCreate(EmergencyAlarmEvent alarmEvent, RedirectAttributes redirectAttributes){
        logger.info("--- 手动添加应急事件 -- alarmEvent " + JSON.toJSONString(alarmEvent));
        String principal = (String) SecurityUtils.getSubject().getPrincipal();
        alarmEvent.setReporter(principal);
        alarmEvent.setCreater(principal);
        alarmEvent.setStatus("上报");
        alarmEvent.setInfluenceRange(1500);
        alarmEvent.setReportDate(new Date());
        alarmEventService.insertAlarmEvent(alarmEvent);
        redirectAttributes.addAttribute("msg", "手动上报应急事件成功！");
        return "redirect:/emergencyResponse/responseList";
    }


    @ResponseBody
    @RequestMapping(value = "{id}/eventAccept", method = RequestMethod.POST)
    public BaseResponse eventAccept(@PathVariable("id") Long id, String status){
        logger.info(" 受理应急报警 -- id ：" + id);
        EmergencyAlarmEvent event = alarmEventService.findById(id);
        if (null != event) {
            event.setStatus(status);
            alarmEventService.updateEvent(event);
        }
        return new BaseResponse("0","已受理");
    }





}
