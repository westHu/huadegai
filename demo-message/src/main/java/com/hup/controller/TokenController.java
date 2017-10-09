package com.hup.controller;

import com.alibaba.fastjson.JSON;
import com.hup.api.message.SmsMessageSendService;
import com.hup.api.message.SmsMessageService;
import com.hup.api.message.SmsTemplateService;
import com.hup.api.message.WsToken;
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

import java.util.UUID;


/**
 * <p>User: hup
 * <p>Date: 14-2-14
 * <p>Version: 1.0
 */
@Controller
@RequestMapping("/token")
public class TokenController {

    Logger logger = LoggerFactory.getLogger(TokenController.class);

//    @Autowired
//    private WsTokenSerive wsTokenSerive;



    /**
     * <p>@Description: 短信列表
     * <p>@Author: hupj
     * <p>@Date: 2017/9/28
     * <p>@Param:
     * <p>@return:
     */
//    @RequiresPermissions("message:view")
    @RequestMapping(value = "/ws", method = RequestMethod.GET)
    public String wsToken_b() {
        String token = UUID.randomUUID().toString();
        return token;
    }



}
