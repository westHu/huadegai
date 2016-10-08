package com.xkeshi.eleme.dtos;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * Created by nt on 2016-09-27.
 */
public class QueryUserDto implements Serializable {

    @NotEmpty(message = "test_1002")
    private String name;

    @NotNull(message = "test_1003")
    private Integer age;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
