package com.xkeshi.demo.dao;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.demo.dtos.QueryUserDto;
import com.xkeshi.demo.dtos.QueryUserResultDto;
import com.xkeshi.demo.entities.QueryUserResult;
import com.xkeshi.demo.entities.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by nt on 2016-09-27.
 */
public interface UserDAO {

    QueryUserResult findResult(@Param("result") QueryUserDto result);

    Long saveUser(User user);

    Pager<QueryUserResultDto> queryResult(@Param("result") QueryUserResult result, @Param("pager") Pager<QueryUserResultDto> pager);

}
