package com.hup.controller.patrol;


import com.alibaba.fastjson.JSON;
import com.hup.api.patrol.PatrolPointDetailService;
import com.hup.api.patrol.PatrolPointService;
import com.hup.db.Pager;
import com.hup.entity.PatrolPoint;
import com.hup.entity.PatrolPointDetail;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.response.DataGridResponse;
import com.hup.util.PageUtils;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 待开发：巡检点应该关联设备（） 并不是所有在此巡检点的所有设备都需要巡检，或者 并不是每次巡检都要巡检该巡检点的所有设备
 * Created by
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/patrol")
public class PatrolPointController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PatrolPointService patrolPointService;

    @Autowired
    private PatrolPointDetailService patrolPointDetailService;


    @RequestMapping(value = "/pointList", method = RequestMethod.GET)
    public String pointList(Model model){
        logger.info(" --- 巡检点列表");
        List<PatrolPoint> patrolPointList = patrolPointService.getAllPoint();
        model.addAttribute("patrolPoint" , JSONArray.fromObject(patrolPointList).toString());

        /*List<PatrolPointDetail> pointDetailList = patrolPointDetailService.getAllPointDetail();
        for (PatrolPointDetail detail : pointDetailList) {
            String coordinateX = detail.getCoordinateX();
            String coordinateY = detail.getCoordinateY();
            double dx = Double.parseDouble(coordinateX) + Math.random() * (0.005) - 0.0025;
            double dy = Double.parseDouble(coordinateY) + Math.random() * (0.005) - 0.0025;
            detail.setCoordinateX(String.valueOf(dx));
            detail.setCoordinateY(String.valueOf(dy));
        }
        model.addAttribute("pointDetailList" , JSONArray.fromObject(pointDetailList).toString());*/

        return "patrol/patrolPointList";
    }


    @ResponseBody
    @RequestMapping(value = "/pointListJson", method = RequestMethod.GET)
    public DataGridResponse pointListJson(PatrolPoint patrolPoint, PageRequest pageRequest){
        logger.info(" --- 巡检点列表 patrolPoint = " + JSON.toJSONString(patrolPoint));
        Pager<PatrolPoint> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getRows()));
        pager = patrolPointService.queryPatrolPointList(patrolPoint, pager);
        DataGridResponse response = new DataGridResponse();
        if (pager.getTotalCount() > 0) {
            response = new DataGridResponse(pager.getTotalCount(),pager.getList());
        }
        return response;
    }


    @ResponseBody
    @RequestMapping(value = "/pointDetailListJson", method = RequestMethod.GET)
    public DataGridResponse pointDetailListJson(String pointId, PageRequest pageRequest){
        logger.info(" --- 巡检点设备列表 pointId = " + pointId);
        if (StringUtils.isBlank(pointId)) {
            return new DataGridResponse();
        }
        Pager<PatrolPointDetail> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getRows()));
        PatrolPointDetail detail = new PatrolPointDetail();
        detail.setPointId(Long.parseLong(pointId));
        pager = patrolPointDetailService.queryPatrolPointDetailList(detail, pager);
        DataGridResponse response = new DataGridResponse();
        if (pager.getTotalCount() > 0) {
            response = new DataGridResponse(pager.getTotalCount(),pager.getList());
        }
        return response;
    }


    @RequestMapping(value = "/pointCreate", method = RequestMethod.POST)
    public String pointCreate(PatrolPoint patrolPoint) {
        logger.info("----巡检点新增 -- patrolPoint = " + JSON.toJSONString(patrolPoint));
        patrolPoint.setPointAgent((String) SecurityUtils.getSubject().getPrincipal());
        patrolPointService.insertPoint(patrolPoint);
        return "redirect:/patrol/pointList";
    }



    @ResponseBody
    @RequestMapping(value = "/pointDelete", method = RequestMethod.DELETE)
    public BaseResponse pointDelete(@RequestBody PatrolPoint patrolPoint) {
        logger.info("----巡检点删除 -- patrolPoint id = " + patrolPoint.getId());
        patrolPointService.deletePoint(patrolPoint.getId());
        return new BaseResponse("0","巡检点删除成功！", null);
    }
}
