package com.hup.api.message;

import com.hup.db.Pager;
import com.hup.entity.SmsMessage;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-06
 * Time: 10:07
 */
public interface SmsMessageService {


    Pager<SmsMessage> querySmsMessageList(Pager<SmsMessage> pager, SmsMessage message); //发送短信列表

    SmsMessage insertSmsMessage(SmsMessage message);
}
