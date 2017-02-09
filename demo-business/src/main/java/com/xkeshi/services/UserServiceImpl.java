package com.xkeshi.services;

import com.xkeshi.apis.UserService;
import com.xkeshi.dao.UserDAO;
import com.xkeshi.db.Pager;
import com.xkeshi.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/2/9.
 */

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDAO userDAO;


    @Override
    public Pager<User> queryUsers(Pager<User> pager, User user) {
        return null;
    }

    @Override
    public List<User> getUserByUserName(String userName) {
        return userDAO.getUserByUserName(userName);
    }

    @Override
    public boolean deleteUser(Long userId) {
        return false;
    }

    @Override
    public User getUserById(Long id) {
        return null;
    }

    @Override
    public void addOrEditUser(User user) {

    }
}
