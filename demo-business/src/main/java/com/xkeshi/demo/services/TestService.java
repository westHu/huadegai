package com.xkeshi.demo.services;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.demo.dtos.QueryUserDto;
import com.xkeshi.demo.dtos.QueryUserResultDto;
import com.xkeshi.demo.entities.QueryUserResult;
import com.xkeshi.demo.entities.User;

/**
 * local服务，入参和返回值可以使用po对象，也可以只用dto对象，但是禁止出现vo对象
 *
 * Created by nt on 2016-05-09.
 */
public interface TestService {

    /**
     * 分页查询，query开头
     *
     * @param result
     * @param pager
     * @return
     */
    Pager<QueryUserResultDto> queryResult(QueryUserResult result, Pager<QueryUserResultDto> pager);

    /**
     * 普通查询
     *
     * @param dto
     * @return
     */
    QueryUserResult findResult(QueryUserDto dto);

    /**
     * 保存user对象
     *
     * @param user
     * @return
     */
    Long saveUser(User user);

}
