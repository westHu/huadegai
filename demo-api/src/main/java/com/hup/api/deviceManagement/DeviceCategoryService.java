package com.hup.api.deviceManagement;

import com.hup.entity.DeviceCategory;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 20:12
 */
public interface DeviceCategoryService {

    String getDeviceCategoryTree();

    List<DeviceCategory> findByParentId(Long parentId);

    DeviceCategory findOne(Long id);


}
