package com.xkeshi.eleme.services.dubboImpl;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.eleme.apis.UserDubboService;
import com.xkeshi.eleme.dtos.*;
import com.xkeshi.eleme.entities.QueryUserResult;
import com.xkeshi.eleme.entities.User;
import com.xkeshi.eleme.services.UserService;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by nt on 2016/9/29.
 */
@Service
public class UserDubboServiceImpl implements UserDubboService {

    @Autowired
    private UserService testService;

    @Autowired
    private Mapper mapper;

    /**
     * dubbo服务调用本地local服务
     *
     * @param dto
     * @return
     */
    @Override
    public Pager<QueryUserResultDto> queryUser(QueryUserDto dto, Pager<QueryUserResultDto> pager) {
        QueryUserResult result = mapper.map(dto, QueryUserResult.class);
        return testService.queryResult(result, pager);
    }

    @Override
    public QueryUserResultDto findUser(String name, Integer age) {
        QueryUserDto dto = new QueryUserDto();
        dto.setName(name);
        dto.setAge(age);
        QueryUserResult result = testService.findResult(dto);
        return mapper.map(result, QueryUserResultDto.class);
    }

    @Override
    public QueryUserResultDto findUser(FindUserParamDto paramDto) {
        QueryUserDto dto = mapper.map(paramDto, QueryUserDto.class);
        QueryUserResult result = testService.findResult(dto);
        return mapper.map(result, QueryUserResultDto.class);
    }

    @Override
    public Boolean updateUser(UpdateUserDto dto) {
        return null;
    }

    @Override
    public Long saveUser(SaveUserDto dto) {
        User user = mapper.map(dto, User.class);
        return testService.saveUser(user);
    }

    @Override
    public Boolean deleteUser(DeleteUserDto dto) {
        return null;
    }

}
