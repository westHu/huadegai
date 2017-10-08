package com.hup.api.message;

import com.hup.db.Pager;
import com.hup.entity.SmsTemplate;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-06
 * Time: 10:07
 */
public interface SmsTemplateService {


    Pager<SmsTemplate> querySmsTemplateList(Pager<SmsTemplate> pager, SmsTemplate template); //发送短信列表

    SmsTemplate insertSmsTemplate(SmsTemplate template);
}
