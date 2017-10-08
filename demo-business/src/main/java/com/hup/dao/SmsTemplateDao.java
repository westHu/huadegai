package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.SmsTemplate;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-06
 * Time: 10:11
 */
public interface SmsTemplateDao {


    List<SmsTemplate> querySmsTemplateList(Pager<SmsTemplate> pager, SmsTemplate message);

    int getSmsTemplateCount(SmsTemplate message);

    int insertSmsTemplate(@Param("message") SmsTemplate message);
}
