package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.SmsMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-06
 * Time: 10:11
 */
public interface SmsMessageDao {


    List<SmsMessage> querySmsMessageList(Pager<SmsMessage> pager, SmsMessage message);

    int getSmsMessageCount(SmsMessage message);

    int insertSmsMessage(@Param("message") SmsMessage message);

    void updateStatus(@Param("message") SmsMessage message);
}
