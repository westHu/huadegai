package com.xkeshi.demo.apis;

import com.xkeshi.core.orm.db.Pager;
import com.xkeshi.demo.dtos.*;

import javax.validation.constraints.NotNull;

/**
 * dubboService，调用localService服务，目前只公开需要开放出去的接口
 */
public interface UserDubboService {

    /**
     * 分页查询demo，入参和返回值均为dto对象，对入参的校验，需要在接口处声明注解
     *
     * @param dto
     * @return
     */
    Pager<QueryUserResultDto> queryUser(@NotNull(message = "test_1001") QueryUserDto dto, Pager<QueryUserResultDto> pager);

    /**
     * 普通查询,以find开头,参数低于三个，直接使用入参
     *
     * @return
     */
    QueryUserResultDto findUser(String name, Integer age);

    /**
     * 普通查询，参数多于三个，包装成一个查询对象.需要使用超过3个dto对象的时候，可以对参数进行断行排版
     *
     * @return
     */
    QueryUserResultDto findUser(@NotNull(message = "test_1001") FindUserParamDto dto);

    /**
     * 更新，以update开头
     *
     * @return
     */
    Boolean updateUser(@NotNull(message = "test_1001") UpdateUserDto dto);

    /**
     * 插入，以save开头
     *
     * @return
     */
    Long saveUser(@NotNull(message = "test_1001") SaveUserDto dto);

    /**
     * 删除，以delete开头
     *
     * @return
     */
    Boolean deleteUser(@NotNull(message = "test_1001") DeleteUserDto dto);

}
