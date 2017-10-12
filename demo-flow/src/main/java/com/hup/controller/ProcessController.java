package com.hup.controller;

import com.alibaba.fastjson.JSON;
import com.hup.api.flow.ProcessDefinitionService;
import com.hup.api.flow.ProcessRuntimeService;
import com.hup.entity.ProcessDefinition;
import com.hup.entity.ProcessRuntime;
import com.hup.response.BaseResponse;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 任务控制器
 * User: west_
 * Date: 2017-10-10
 * Time: 13:29
 */
@Controller
@RequestMapping("/process")
public class ProcessController {

    Logger logger = LoggerFactory.getLogger(ProcessController.class);

    @Autowired
    private ProcessDefinitionService processDefinitionService;

    @Autowired
    private ProcessRuntimeService processRuntimeService;



    @RequestMapping(value = "/definitionList", method = RequestMethod.GET)
    public String processDefinitionList(Model model) {
        logger.info("----->工作流定义列表");
        List<ProcessDefinition> processDefinitions = processDefinitionService.findAllDefinition();
        if (CollectionUtils.isNotEmpty(processDefinitions)){
            String name =  processDefinitions.get(0).getName();
            List<ProcessDefinition> definitionsByName = processDefinitionService.findDefinitionStepByName(name);
            model.addAttribute("definitionsByName", definitionsByName);
            model.addAttribute("name", name);
        }else {
            model.addAttribute("definitionsByName", new ArrayList<ProcessDefinition>());
            model.addAttribute("name", "");
        }
        model.addAttribute("processDefinitions", processDefinitions);
        model.addAttribute("flag", "流程管理,流程定义");
        return "flow/definitionList";
    }

    @RequestMapping(value = "/{name}/definitionView", method = RequestMethod.GET)
    public String definitionView(@PathVariable("name") String name,  Model model) {
        logger.info("----->工作流 -- name : " + name);
        setDefinitions(model);
        List<ProcessDefinition> definitionsByName = processDefinitionService.findDefinitionStepByName(name);
        model.addAttribute("definitionsByName", definitionsByName);
        model.addAttribute("name", name);
        model.addAttribute("flag", "流程管理,流程定义");
        return "flow/definitionList";
    }

    /**
     * <p>@Description: 查询单个流程定义进行更新
     * <p>@Author: hupj
     * <p>@Date: 2017/10/11
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/{id}/definition", method = RequestMethod.POST)
    public BaseResponse definitionUpdate(@PathVariable("id") String id) {
        logger.info("----->工作流更新 -- id : " + id);
        ProcessDefinition processDefinition = processDefinitionService.findOne(id);
        return new BaseResponse("0", "查询成功！", processDefinition);
    }


    @RequestMapping(value = "/definitionUpdate", method = RequestMethod.POST)
    public String definitionUpdate(ProcessDefinition processDefinition) {
        logger.info("----->工作流更新 -- processDefinition : " + JSON.toJSONString(processDefinition));
//        ProcessDefinition processDefinition = processDefinitionService.update(processDefinition);
        return "redirect:process/definitionList";
    }


    /***====runtime=====================*/



    @RequestMapping(value = "/runtimeList", method = RequestMethod.GET)
    public String processRuntimeList(Model model) {
        logger.info("----->工作流进行时记录列表");
        List<ProcessRuntime> processRuntimes = processRuntimeService.findAllRuntime();

        model.addAttribute("processRuntimes", processRuntimes);
        model.addAttribute("flag", "流程管理,流程");
        return "flow/runtimeList";
    }












    private void setDefinitions(Model model){
        List<ProcessDefinition> processDefinitions = processDefinitionService.findAllDefinition();
        model.addAttribute("processDefinitions", processDefinitions);
    }

}