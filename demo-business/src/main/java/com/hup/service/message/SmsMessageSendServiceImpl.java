package com.hup.service.message;

import com.hup.api.message.SmsMessageSendService;
import com.hup.dao.SmsMessageDao;
import com.hup.entity.SmsMessage;
import com.hup.service.message.send.HupOneGatewayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-08
 * Time: 12:56
 */
@Service
public class SmsMessageSendServiceImpl implements SmsMessageSendService{


    @Autowired
    private HupOneGatewayService hupOneGatewayService;

    @Autowired
    private SmsMessageDao smsMessageDao;

    @Override
    public boolean singleSend(SmsMessage smsMessage) {
        SmsMessage message = hupOneGatewayService.singleSend(smsMessage);
        if (null != message) {
            smsMessageDao.updateStatus(message);
        }
        return true;
    }


    @Override
    public boolean batchSend(List<SmsMessage> smsMessageList) {
        return false;
    }
}
