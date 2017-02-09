package com.xkeshi.dao;


import com.xkeshi.entities.User;

import java.util.List;

/**
 * Created by peppa pig
 */
public interface UserDAO {

    List<User> getUserByUserName(String userName);

}
