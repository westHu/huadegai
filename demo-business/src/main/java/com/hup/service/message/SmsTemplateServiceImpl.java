package com.hup.service.message;

import com.hup.api.message.SmsTemplateService;
import com.hup.dao.SmsTemplateDao;
import com.hup.db.Pager;
import com.hup.entity.SmsTemplate;
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
public class SmsTemplateServiceImpl implements SmsTemplateService {


    @Autowired
    private SmsTemplateDao smsTemplateDao;

    @Override
    public Pager<SmsTemplate> querySmsTemplateList(Pager<SmsTemplate> pager, SmsTemplate template) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<SmsTemplate> templateList = smsTemplateDao.querySmsTemplateList(pager, template);
        int count = smsTemplateDao.getSmsTemplateCount(template);
        pager.setList(templateList);
        pager.setTotalCount(count);
        return pager;
    }

    @Override
    public SmsTemplate insertSmsTemplate(SmsTemplate message) {
        smsTemplateDao.insertSmsTemplate(message);
        return message;
    }
}
