package com.hup.api.emergency;

import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyAlarmEvent;

import java.util.List;


/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-29
 * Time: 15:34
 */
public interface EmergencyAlarmEventService {

    Pager<EmergencyAlarmEvent> queryAlarmEventList(EmergencyAlarmEvent alarmEvent, Pager<EmergencyAlarmEvent> pager);

    List<EmergencyAlarmEvent> findAlarmEventListByStatus(String status);
}
