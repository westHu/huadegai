package com.xkeshi.demo.controllers;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.demo.apis.UserDubboService;
import com.xkeshi.demo.dtos.QueryUserDto;
import com.xkeshi.demo.dtos.QueryUserResultDto;
import com.xkeshi.demo.services.UserService;
import com.xkeshi.demo.requests.TestRequest;
import com.xkeshi.demo.responses.TestResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * Created by nt on 2016/4/12.
 *
 * requestMapping 统一以'/'开头
 * 建议使用restful的接口，比如/operator/{id}。
 * 方法名称使用add/save, update/modify, delete, get/list/view对应RequestMethod里的post, put, delete, get;其他的随意
 *
 */
@Controller
public class TestController {

    @Autowired
    private UserService testService;

    @Autowired
    private UserDubboService testDubboService;

    /**
     * 如果需要校验参数，@Valid注解一定需要加，否则校验不会生效
     *
     * @param request
     * @return 返回值的问题，框架里默认会包装一个Result对象，会包含code， descrition 与业务对象，请不要自己封装code，description，只需要返回业务对象（XXXResponse）
     */
    @RequestMapping(value = "/test", method = RequestMethod.GET)
    @ResponseBody
    public TestResponse test(@Valid TestRequest request) {
        //调用local服务，此时入参可以是po对象，也可以为dto对象，但是禁止出现vo对象
        QueryUserDto dto = new QueryUserDto();
        Pager<QueryUserResultDto> pager = new Pager<>();
        dto.setAge(request.getAge());
        dto.setName(request.getName());
        testService.findResult(dto);

        //调用dubbo服务，此时入参一定是实现了可序列化接口的dto对象
        testDubboService.queryUser(dto, pager);

        return new TestResponse();
    }
}
