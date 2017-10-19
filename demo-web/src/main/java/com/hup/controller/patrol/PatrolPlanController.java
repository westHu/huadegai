package com.hup.controller.patrol;


import com.alibaba.fastjson.JSON;
import com.hup.api.patrol.PatrolPlanService;
import com.hup.db.Pager;
import com.hup.entity.PatrolPlan;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.util.PageUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/patrol")
public class PatrolPlanController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private PatrolPlanService patrolPlanService;


    @RequestMapping(value = "/planList", method = RequestMethod.GET)
    public String planList(PatrolPlan patrolPlan, PageRequest pageRequest, Model model){
        logger.info(" --- 巡检计划列表 patrolPlan = " + JSON.toJSONString(patrolPlan));
        Pager<PatrolPlan> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = patrolPlanService.queryPatrolPlanList(patrolPlan, pager);

        model.addAttribute("pager" ,pager);
        model.addAttribute("request", patrolPlan);
        return "patrol/patrolPlanList";
    }



    @RequestMapping(value = "/planCreate", method = RequestMethod.GET)
    public String planCreateForm(Model model) {
        logger.info("----巡检计划 新增页面 -- ");
        String username = (String) SecurityUtils.getSubject().getPrincipal();
        PatrolPlan patrolPlan = new PatrolPlan();
        patrolPlan.setPlanCreater(username);
        model.addAttribute("patrolPlan", patrolPlan);
        model.addAttribute("op", "新增");
        return "patrol/patrolPlanCreate";
    }



    @ResponseBody
    @RequestMapping(value = "/planDelete", method = RequestMethod.DELETE)
    public BaseResponse planDelete(@RequestBody PatrolPlan patrolPlan) {
        logger.info("----巡检点删除 -- patrolPlan id = " + patrolPlan.getId());
        patrolPlanService.deletePlan(patrolPlan.getId());
        return new BaseResponse("0","巡检点删除成功！", null);
    }
}
