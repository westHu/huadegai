package com.hup.controller;

import com.alibaba.fastjson.JSON;
import com.hup.api.message.SmsMessageSendService;
import com.hup.api.message.SmsMessageService;
import com.hup.api.message.SmsTemplateService;
import com.hup.db.Pager;
import com.hup.entity.SmsMessage;
import com.hup.entity.SmsTemplate;
import com.hup.util.PageRequest;
import com.hup.util.PageUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Controller
@RequestMapping("/smsMessage")
public class SmsMessageController {

    Logger logger = LoggerFactory.getLogger(SmsMessageController.class);

    @Autowired
    private SmsMessageSendService smsMessageSendService;

    @Autowired
    private SmsMessageService smsMessageService;

    @Autowired
    private SmsTemplateService smsTemplateService;


    /**
     * <p>@Description: 短信列表
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("message:view")
    @RequestMapping(method = RequestMethod.GET)
    public String list(SmsMessage smsMessage, PageRequest pageRequest, Model model) {
        logger.info("-----> 短信列表");
        Pager<SmsMessage> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = smsMessageService.querySmsMessageList(pager, smsMessage);
        model.addAttribute("page", pager);
        model.addAttribute("flag", "消息管理,短信管理");
        return "message/smsMessageList";
    }


    /**
     * <p>@Description: 模板列表
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("message:view")
    @RequestMapping(value = "/smsTemplateList", method = RequestMethod.GET)
    public String templateList(SmsTemplate smsTemplate, PageRequest pageRequest, Model model) {
        logger.info("-----> 短信模板列表");
        Pager<SmsTemplate> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getCurrentPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getPageSize()));
        pager = smsTemplateService.querySmsTemplateList(pager, smsTemplate);
        model.addAttribute("page", pager);
        model.addAttribute("flag", "消息管理,短信管理");
        return "message/smsTemplateList";
    }


    /**
     * <p>@Description: 短信保存并且立即发送
     * <p>@Author: hupj
     * <p>@Date: 2017/10/6
     * <p>@Param:
     * <p>@return:
     */
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String create(SmsMessage smsMessage, RedirectAttributes redirectAttributes) {
        logger.info("-------保存并发送短信 --" + JSON.toJSONString(smsMessage));
        /** 保存 */
        smsMessage.setStatus("发送中");
        smsMessageService.insertSmsMessage(smsMessage);
        /** 立即发送 */
        String msg = "短信保存，发送失败！";
        boolean send = smsMessageSendService.singleSend(smsMessage);
        if (send){
            msg = "短信发送成功！";
        }

        redirectAttributes.addFlashAttribute("msg", msg);
        return "redirect:/smsMessage";
    }

}
