package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dao.UserDao;
import com.pojo.User;
import com.util.MyConnectionUtils;

public class UserDaoImpl  implements UserDao{

	 @Override
	    public User selectByUnameAndPwd(String uname, String pwd) {
	        //调用连接池类
	        MyConnectionUtils myConnectionUtils = new MyConnectionUtils();

	        //调用连接池中连接
	        Connection connection = null;
	        try {
	            connection = myConnectionUtils.getConnection();
	        } catch (InterruptedException e) {
	            e.printStackTrace();
	        }

	        //获取预处理对象

	        String sql="select * from user where uname=? and pwd = ? ";
	        PreparedStatement ps = null;
	        User user = null;
	        try {
	             ps= connection.prepareStatement(sql);


	            //占位符的赋值
	            ps.setString(1,uname);
	            ps.setString(2,pwd);


	            //返回结果集
	            ResultSet rs = ps.executeQuery();

	            //处理结果集
	            while (rs.next()){
	                int uid = rs.getInt("uid");
	                String uname1 = rs.getString("uname");
	                String pwd1 = rs.getString("pwd");

	                //将查询的结果储存在实体类内
	                user = new User(uid,uname1,pwd1);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
	            //关闭，释放资源
	            try {
	                if (ps!=null){
	                    ps.close();
	                }

	                if(connection!=null){
	                    myConnectionUtils.closeConnection(connection);
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }


	        //返回用户对象
	        return user;
	    }
	}
