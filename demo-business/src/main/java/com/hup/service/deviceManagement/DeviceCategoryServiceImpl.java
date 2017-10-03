package com.hup.service.deviceManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.deviceManagement.DeviceCategoryService;
import com.hup.dao.DeviceCategoryDao;
import com.hup.entity.DeviceCategory;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: west_
 * Date: 2017-10-03
 * Time: 20:17
 */
@Service
public class DeviceCategoryServiceImpl implements DeviceCategoryService {

    @Autowired
    private DeviceCategoryDao deviceCategoryDao;

    @Override
    public String getDeviceCategoryTree() {
        List<DeviceCategory> deviceCategoryList = findTree(0L);
        String jsonString = JSON.toJSONString(deviceCategoryList);
        String result = jsonString.replaceAll("categoryName","text");
        return result;
    }

    @Override
    public List<DeviceCategory> findByParentId(Long parentId) {
        return deviceCategoryDao.findByParentId(parentId);
    }

    @Override
    public DeviceCategory findOne(Long id) {
        return deviceCategoryDao.findOne(id);
    }

    private List<DeviceCategory> findTree(Long parentId) {
        List<DeviceCategory> deviceCategoryList = findByParentId(parentId);
        if (CollectionUtils.isNotEmpty(deviceCategoryList)){
            for (DeviceCategory deviceCategory : deviceCategoryList){
                List<DeviceCategory> tree = findTree(deviceCategory.getId());
                List<String> tags = new ArrayList<>();
                tags.add(String.valueOf(tree.size()));
                deviceCategory.setTags(tags);
                deviceCategory.setNodes(tree);
                DeviceCategory parent = deviceCategoryDao.findOne(deviceCategory.getParentId());
                deviceCategory.setParentName(parent != null ? parent.getCategoryName(): "无父节点");
            }
        }
        return deviceCategoryList;
    }
}
