package com.hup.controller.emergencyManagement;

import com.alibaba.fastjson.JSON;
import com.hup.api.emergency.EmergencyResourceDetailService;
import com.hup.api.emergency.EmergencyResourcePointService;
import com.hup.db.Pager;
import com.hup.entity.User;
import com.hup.entity.emergency.EmergencyResourcePoint;
import com.hup.request.PageRequest;
import com.hup.response.BaseResponse;
import com.hup.response.DataGridResponse;
import com.hup.response.EmergencyResponse;
import com.hup.util.PageUtils;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nt on 2016/4/12.
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
@RequestMapping("/emergencyResource")
public class EmergencyResourceController {

    Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private EmergencyResourcePointService pointService;

    private EmergencyResourceDetailService detailService;



    @RequestMapping(value = "/pointList", method = RequestMethod.GET)
    public String emergencyResourceList(){
        return "/emergencyManagement/emergencyResourceList";
    }

    @ResponseBody
    @RequestMapping(value = "/pointListByType", method = RequestMethod.GET)
    public DataGridResponse pointListByType(String types, PageRequest pageRequest){
        if (StringUtils.isBlank(types)) {
            return new DataGridResponse();
        }
        String[] split = types.split(",");
        Pager<EmergencyResourcePoint> pager = new Pager<>();
        pager.setCurrentPage(PageUtils.getCorrectCurrentPage(pageRequest.getPage()));
        pager.setPageSize(PageUtils.getCorrectCurrentPageSize(pageRequest.getRows()));
        pager = pointService.queryPointListByType(split, pager);
        DataGridResponse response = new DataGridResponse(pager.getTotalCount(), pager.getList());

        /*String result = "{\"total\":28,\"rows\":[\n" +
                "\t{\"productid\":\"FI-SW-01\",\"productname\":\"Koi\",\"unitcost\":10.00,\"status\":\"P\",\"listprice\":36.50,\"attr1\":\"Large\",\"itemid\":\"EST-1\"},\n" +
                "\t{\"productid\":\"K9-DL-01\",\"productname\":\"Dalmation\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":18.50,\"attr1\":\"Spotted Adult Female\",\"itemid\":\"EST-10\"},\n" +
                "\t{\"productid\":\"RP-SN-01\",\"productname\":\"Rattlesnake\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":38.50,\"attr1\":\"Venomless\",\"itemid\":\"EST-11\"},\n" +
                "\t{\"productid\":\"RP-SN-01\",\"productname\":\"Rattlesnake\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":26.50,\"attr1\":\"Rattleless\",\"itemid\":\"EST-12\"},\n" +
                "\t{\"productid\":\"RP-LI-02\",\"productname\":\"Iguana\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":35.50,\"attr1\":\"Green Adult\",\"itemid\":\"EST-13\"},\n" +
                "\t{\"productid\":\"FL-DSH-01\",\"productname\":\"Manx\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":158.50,\"attr1\":\"Tailless\",\"itemid\":\"EST-14\"},\n" +
                "\t{\"productid\":\"FL-DSH-01\",\"productname\":\"Manx\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":83.50,\"attr1\":\"With tail\",\"itemid\":\"EST-15\"},\n" +
                "\t{\"productid\":\"FL-DLH-02\",\"productname\":\"Persian\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":23.50,\"attr1\":\"Adult Female\",\"itemid\":\"EST-16\"},\n" +
                "\t{\"productid\":\"FL-DLH-02\",\"productname\":\"Persian\",\"unitcost\":12.00,\"status\":\"P\",\"listprice\":89.50,\"attr1\":\"Adult Male\",\"itemid\":\"EST-17\"},\n" +
                "\t{\"productid\":\"AV-CB-01\",\"productname\":\"Amazon Parrot\",\"unitcost\":92.00,\"status\":\"P\",\"listprice\":63.50,\"attr1\":\"Adult Male\",\"itemid\":\"EST-18\"}\n" +
                "]}\n";*/
        return response;
    }



    @ResponseBody
    @RequestMapping(value = "/pointJson", method = RequestMethod.POST)
    public BaseResponse emergencyResourceList(String types){
        logger.info("获取数据 --- type： " + types);
        String desc = null;
        List<EmergencyResponse> list = new ArrayList<>();

        if (StringUtils.isBlank(types)){
            return new BaseResponse("0", null);
        }
        for (String type : types.split(",")) {
            List<EmergencyResourcePoint> points = pointService.findPointByType(type);
            for (EmergencyResourcePoint materialPoint : points) {
                EmergencyResponse response = new EmergencyResponse();
                BeanUtils.copyProperties(materialPoint, response);
                list.add(response);
            }
        }
        JSONArray jsonArray = JSONArray.fromObject(JSON.toJSONString(list));
        //转成String类型，这里要解释，虽然后面的param的type是json，但是并不影响实际参数是字符串
        //System.out.println("jsonArray.toString() = " + jsonArray.toString());
        return new BaseResponse("0", desc, jsonArray.toString());
    }


}
