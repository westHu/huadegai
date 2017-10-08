package com.hup.api.message;

import com.hup.entity.SmsMessage;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-08
 * Time: 12:54
 */
public interface SmsMessageSendService {

    boolean singleSend(SmsMessage smsMessage);

    boolean batchSend(List<SmsMessage> smsMessageList);

}
