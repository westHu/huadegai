package com.hup.controller.patrol;


import com.alibaba.fastjson.JSON;
import com.hup.api.patrol.PatrolPointService;
import com.hup.db.Pager;
import com.hup.entity.DevicePurchase;
import com.hup.entity.PatrolPoint;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.PageUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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


    @RequestMapping(value = "/pointList", method = RequestMethod.GET)
    public String pointList(PatrolPoint patrolPoint, PageRequest pageRequest, Model model){
        logger.info(" --- 巡检点列表 patrolPoint = " + JSON.toJSONString(patrolPoint));
        Pager<PatrolPoint> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = patrolPointService.queryPatrolPointList(patrolPoint, pager);

        model.addAttribute("pager" ,pager);
        model.addAttribute("request", patrolPoint);
        return "patrol/patrolPointList";
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
