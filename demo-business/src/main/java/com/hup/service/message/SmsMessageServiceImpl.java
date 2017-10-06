package com.hup.service.message;

import com.hup.api.message.SmsMessageService;
import com.hup.dao.SmsMessageDao;
import com.hup.db.Pager;
import com.hup.entity.SmsMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-06
 * Time: 10:10
 */
@Service
public class SmsMessageServiceImpl implements SmsMessageService {


    @Autowired
    private SmsMessageDao smsMessageDao;

    @Override
    public Pager<SmsMessage> querySmsMessageList(Pager<SmsMessage> pager, SmsMessage message) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<SmsMessage> messageList = smsMessageDao.querySmsMessageList(pager, message);
        int count = smsMessageDao.getSmsMessageCount(message);
        pager.setList(messageList);
        pager.setTotalCount(count);
        return pager;
    }

    @Override
    public SmsMessage insertSmsMessage(SmsMessage message) {
        smsMessageDao.insertSmsMessage(message);
        return message;
    }
}
