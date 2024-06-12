package com.service.impl;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.pojo.User;
import com.service.UserService;



public class UserServiceImpl implements UserService {

    @Override
    public User selectByUnameAndPwd(String uname, String pwd) {
        UserDaoImpl userDao = new UserDaoImpl();

        return userDao.selectByUnameAndPwd(uname,pwd);
    }
}
