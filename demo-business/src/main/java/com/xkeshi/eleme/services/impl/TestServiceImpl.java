package com.xkeshi.eleme.services.impl;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.eleme.dao.UserDAO;
import com.xkeshi.eleme.dtos.QueryUserDto;
import com.xkeshi.eleme.dtos.QueryUserResultDto;
import com.xkeshi.eleme.entities.QueryUserResult;
import com.xkeshi.eleme.entities.User;
import com.xkeshi.eleme.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by nt on 2016-05-09.
 */
@Service
public class TestServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    @Override
    public QueryUserResult findResult(QueryUserDto dto) {
        return userDAO.findResult(dto);
    }

    @Override
    public Pager<QueryUserResultDto> queryResult(QueryUserResult result, Pager<QueryUserResultDto> pager) {
        return userDAO.queryResult(result, pager);
    }

    @Override
    public Long saveUser(User user) {
        userDAO.saveUser(user);
        return user.getId();
    }
}
