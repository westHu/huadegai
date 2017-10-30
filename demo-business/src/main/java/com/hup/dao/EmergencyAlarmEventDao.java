package com.hup.dao;

import com.hup.db.Pager;
import com.hup.entity.emergency.EmergencyAlarmEvent;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-29
 * Time: 15:40
 */
public interface EmergencyAlarmEventDao {

    List<EmergencyAlarmEvent> queryAlarmEventCountListByPoint(@Param("alarm") EmergencyAlarmEvent alarmEvent, @Param("pager") Pager<EmergencyAlarmEvent> pager);

    int getAlarmEventListByPointCount(@Param("alarm") EmergencyAlarmEvent alarmEvent);

    List<EmergencyAlarmEvent> findAlarmEventListByStatus(String status);

    EmergencyAlarmEvent findById(Long id);

    int updateEvent(@Param("alarm") EmergencyAlarmEvent alarm);
}
