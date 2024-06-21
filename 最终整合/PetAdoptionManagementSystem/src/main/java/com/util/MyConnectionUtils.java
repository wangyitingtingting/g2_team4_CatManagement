package com.util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.LinkedList;
import java.util.Properties;

import com.util.MyConnectionUtils;

public class MyConnectionUtils {


    //1、创建LinkedList集合（存入线程
    //Connection,数据库操作对象
    static LinkedList<Connection> linkedList = new LinkedList<>();


    static {
        //2、通过流的形式，读取是数据库的配置文件
        //InputStream resourceAsStream = MyConnectionUtils.class.getClassLoader().getResourceAsStream("db.properties");

        //3、调用Properties();类
        //Properties properties = new Properties();
        try {
            //properties.load(resourceAsStream);
//            String mysqlDriver = (String) properties.get("mysqlDriver");
//            String mysqlUrl = (String) properties.get("mysqlUrl");
//            String mysqlName = (String) properties.get("mysqlName");
//            String mysqlPassword = (String) properties.get("mysqlPassword");
            
            String mysqlDriver = "com.mysql.cj.jdbc.Driver";
            String mysqlUrl = "jdbc:mysql://127.0.0.1:3306/pet?serverTimezone=Asia/Shanghai&useSSL=false&characterEncoding=utf8&useUnicode=true";
            String mysqlName = "root";
            String mysqlPassword = "123456";

            //4、加载驱动
            Class.forName(mysqlDriver);
            //5、使用循环获取10个连接，并把连接数放到连接池内
            for (int i = 0; i < 10; i++) {
                //6、使用内置对象DriverManager调用getConnection方法，把数据掺入里面
                Connection connection = DriverManager.getConnection(mysqlUrl, mysqlName, mysqlPassword);

                //7、放入集合
                linkedList.add(connection);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }



    }

    //6、创建连接方法，好让实体类调用（用于传入sql语句以及执行其他几部）
    //使用同步关键字实现线程同步，
    //因为涉及等待，所以synchronized是同步锁
    public synchronized Connection getConnection() throws InterruptedException {
        //如果内部线程等于0 .代表线程被拿完了
        if (linkedList.size()==0){
            this.wait();
        }

        //如果有人来拿连接，那么连接池就会移除一个连接，代表打走了
        Connection remove = linkedList.remove(0);
        return remove;
    }


    //7、将连接放回连接处
    public synchronized void closeConnection(Connection connection){
        linkedList.add(connection);
        //唤醒等待的线程
        this.notifyAll();
    }
}
