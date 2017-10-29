package com.hup.service.emergency;

import com.hup.api.emergency.EmergencyAlarmEventService;
import com.hup.dao.EmergencyAlarmEventDao;
import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyAlarmEvent;
import com.hup.entity.emergency.EmergencyResourceDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-29
 * Time: 15:39
 */
@Service
public class EmergencyAlarmEventServiceImpl implements EmergencyAlarmEventService {

    @Autowired
    private EmergencyAlarmEventDao alarmEventDao;

    @Override
    public Pager<EmergencyAlarmEvent> queryAlarmEventList(EmergencyAlarmEvent alarmEvent, Pager<EmergencyAlarmEvent> pager) {
        if (pager == null) {
            pager = new Pager<>();
        }
        pager.setOrderColumns("id"); //时间倒序查询
        List<EmergencyAlarmEvent> alarmEventList = alarmEventDao.queryAlarmEventCountListByPoint(alarmEvent, pager);
        int alarmEventCount = alarmEventDao.getAlarmEventListByPointCount(alarmEvent);
        pager.setList(alarmEventList);
        pager.setTotalCount(alarmEventCount);
        return pager;
    }
}
