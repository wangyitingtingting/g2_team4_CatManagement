package com.dao;

import com.pojo.User;

public interface UserDao {
	  public User selectByUnameAndPwd(String uname,String pwd);

	}
