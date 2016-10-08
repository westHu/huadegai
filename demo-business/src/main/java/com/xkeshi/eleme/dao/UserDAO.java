package com.xkeshi.eleme.dao;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.eleme.dtos.QueryUserDto;
import com.xkeshi.eleme.dtos.QueryUserResultDto;
import com.xkeshi.eleme.entities.QueryUserResult;
import com.xkeshi.eleme.entities.User;
import org.apache.ibatis.annotations.Param;

/**
 * Created by nt on 2016-09-27.
 */
public interface UserDAO {

    QueryUserResult findResult(@Param("result") QueryUserDto result);

    Long saveUser(User user);

    Pager<QueryUserResultDto> queryResult(@Param("result") QueryUserResult result, @Param("pager") Pager<QueryUserResultDto> pager);

}
