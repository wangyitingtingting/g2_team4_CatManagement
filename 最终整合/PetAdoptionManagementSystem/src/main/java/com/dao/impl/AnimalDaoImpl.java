package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.util.StringUtils;
import com.pojo.Animal;
import com.util.MyConnectionUtils;
import com.dao.AnimalDao;

public class AnimalDaoImpl implements AnimalDao{

	  public List<Animal> selectAllAnimal(String animalType, String animalGender) {

	        //获取连接池
	        MyConnectionUtils myConnectionUtils = new MyConnectionUtils();
	        Connection connection=null;
	        PreparedStatement ps = null;
	        ArrayList<Animal> animals = new ArrayList<>();
	        //获取连接
	        try {
	            connection= myConnectionUtils.getConnection();

	            String sql="select * from animals where 1 =1 ";
                if(animalType != null && !animalType.equals("")){
                    sql+=" and animalType = '"+animalType+"'";
                }
                if(animalGender != null && !animalGender.equals("")){
                    sql+=" and animalGender = '"+animalGender+"'";
                }
	             ps= connection.prepareStatement(sql);


	            //执行sql
	            ResultSet rs = ps.executeQuery();

	            //处理结果集
	            while (rs.next()){
	            	  int id1 = rs.getInt("AnimalId");
	                  String AnimalName = rs.getString("AnimalName");
	                  String AnimalType = rs.getString("AnimalType");
	                  String AnimalGender = rs.getString("AnimalGender");
	                  String Health = rs.getString("Health");
	                  String LYStatus = rs.getString("LYStatus");
	                  int Age = rs.getInt("Age");
	                  String PicAnimal = rs.getString("PicAnimal");
	                  String username = rs.getString("UserName");
	                  Animal a = new Animal();
	                  a.setAnimalId(id1);
	                  a.setAge(Age);
	                a.setAnimalGender(AnimalGender);
	                a.setAnimalName(AnimalName);
	                a.setAnimalType(AnimalType);
	                a.setHealth(Health);
	                a.setLYStatus(LYStatus);
	                a.setPicAnimal(PicAnimal);
	                a.setUserName(username);
	                animals.add(a);
	            }
	        } catch (InterruptedException | SQLException e) {
	            e.printStackTrace();
	        }finally {
	            try {
	                if (ps!=null){
	                    ps.close();
	                }
	                if (connection!=null){
	                    myConnectionUtils.closeConnection(connection);
	                }

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }


	        return animals;
	    }

	    @Override
	    public void insertAnimal(Animal animal) {


	        //获取连接池
	        MyConnectionUtils myConnectionUtils = new MyConnectionUtils();
	        Connection connection=null;
	        PreparedStatement ps = null;



	        try {
	            //获取连接
	            connection= myConnectionUtils.getConnection();

	            //手动开启事务
	            connection.setAutoCommit(false);

	            String sql="insert into animals values (null,?,?,?,?,0,?,?,null)";
	            ps= connection.prepareStatement(sql);
	 
	            
	            ps.setString(1,animal.getAnimalName());
	            ps.setString(2,animal.getAnimalType());
	            ps.setString(3,animal.getAnimalGender());
	            ps.setString(4,animal.getHealth());
	            ps.setInt(5,animal.getAge());
	            ps.setString(6,animal.getPicAnimal()); 


	            //执行sql
	            ps.executeUpdate();

	            connection.commit();

	        } catch (InterruptedException | SQLException e) {
	            //事务回滚
	            try {
	                connection.rollback();
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            }

	            e.printStackTrace();
	        }finally {
	            try {
	                if (ps!=null){
	                    ps.close();
	                }
	                if (connection!=null){
	                    myConnectionUtils.closeConnection(connection);
	                }

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	    }

	    @Override
	    public void delectById(int id) {
	        //获取连接池
	        MyConnectionUtils myConnectionUtils = new MyConnectionUtils();
	        Connection connection=null;
	        PreparedStatement ps = null;



	        try {
	            //获取连接
	            connection= myConnectionUtils.getConnection();

	            //手动开启事务
	            connection.setAutoCommit(false);

	            String sql="delete  from  animals where AnimalId=?";
	            ps= connection.prepareStatement(sql);

	            //先完成占位符的赋值，然后在执行
	           ps.setInt(1,id);



	            //执行sql
	            ps.executeUpdate();


	            connection.commit();

	        } catch (InterruptedException | SQLException e) {
	            //事务回滚
	            try {
	                connection.rollback();
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            }

	            e.printStackTrace();
	        }finally {
	            try {
	                if (ps!=null){
	                    ps.close();
	                }
	                if (connection!=null){
	                    myConnectionUtils.closeConnection(connection);
	                }

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }

	    }

	    @Override
	    public Animal selectAnimalById(int id) {
	        //获取连接池
	        MyConnectionUtils myConnectionUtils = new MyConnectionUtils();
	        Connection connection=null;
	        PreparedStatement ps = null;
	       Animal a =null;
	        //获取连接
	        try {
	            connection= myConnectionUtils.getConnection();

	            String sql="select * from animals where AnimalId =?";
	            ps= connection.prepareStatement(sql);

	            //占位符的赋值
	            ps.setInt(1,id);

	            //执行sql
	            ResultSet rs = ps.executeQuery();

	            //处理结果集
	            while (rs.next()){
	                int id1 = rs.getInt("AnimalId");
	                String AnimalName = rs.getString("AnimalName");
	                String AnimalType = rs.getString("AnimalType");
	                String AnimalGender = rs.getString("AnimalGender");
	                String Health = rs.getString("Health");
	                String LYStatus = rs.getString("LYStatus");
	                int Age = rs.getInt("Age");
	                String PicAnimal = rs.getString("PicAnimal");
	                
	                a = new Animal();
	                a.setAnimalId(id1);
	                a.setAge(Age);
	              a.setAnimalGender(AnimalGender);
	              a.setAnimalName(AnimalName);
	              a.setAnimalType(AnimalType);
	              a.setHealth(Health);
	              a.setLYStatus(LYStatus);
	              a.setPicAnimal(PicAnimal);

	            }
	        } catch (InterruptedException | SQLException e) {
	            e.printStackTrace();
	        }finally {
	            try {
	                if (ps!=null){
	                    ps.close();
	                }
	                if (connection!=null){
	                    myConnectionUtils.closeConnection(connection);
	                }

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }


	        return a;
	    }

	    @Override
	    public void updateAnimalById(Animal animal) {
	        //获取连接池
	        MyConnectionUtils myConnectionUtils = new MyConnectionUtils();
	        Connection connection=null;
	        PreparedStatement ps = null;



	        try {
	            //获取连接
	            connection= myConnectionUtils.getConnection();

	            //手动开启事务
	            connection.setAutoCommit(false);

	            String sql="update animals set AnimalName=?,AnimalType=?,AnimalGender=?,Health=?,Age=?, PicAnimal=? where AnimalId = ?";
	            if("".equals(animal.getPicAnimal())) {
	            	   sql="update animals set AnimalName=?,AnimalType=?,AnimalGender=?,Health=?,Age=?  where AnimalId = ?";
	            	   ps= connection.prepareStatement(sql);

	                   //先完成占位符的赋值，然后在执行
	                   ps.setString(1,animal.getAnimalName());
	                   ps.setString(2,animal.getAnimalType());
	                   ps.setString(3,animal.getAnimalGender());
	                   ps.setString(4,animal.getHealth());
	                   ps.setInt(5,animal.getAge()); 
	                   ps.setInt(6,animal.getAnimalId());

	            }else {
	            	 ps= connection.prepareStatement(sql);
	                 //先完成占位符的赋值，然后在执行
	                 ps.setString(1,animal.getAnimalName());
	                 ps.setString(2,animal.getAnimalType());
	                 ps.setString(3,animal.getAnimalGender());
	                 ps.setString(4,animal.getHealth());
	                 ps.setInt(5,animal.getAge());
	                 ps.setString(6,animal.getPicAnimal());
	                 ps.setInt(7,animal.getAnimalId());

	            }
	            ps= connection.prepareStatement(sql);

	            //先完成占位符的赋值，然后在执行
	            ps.setString(1,animal.getAnimalName());
	            ps.setString(2,animal.getAnimalType());
	            ps.setString(3,animal.getAnimalGender());
	            ps.setString(4,animal.getHealth());
	            ps.setInt(5,animal.getAge());
	            ps.setString(6,animal.getPicAnimal());
	            ps.setInt(7,animal.getAnimalId());


	 


	            //执行sql
	            ps.executeUpdate();


	            connection.commit();

	        } catch (InterruptedException | SQLException e) {
	            //事务回滚
	            try {
	                connection.rollback();
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            }

	            e.printStackTrace();
	        }finally {
	            try {
	                if (ps!=null){
	                    ps.close();
	                }
	                if (connection!=null){
	                    myConnectionUtils.closeConnection(connection);
	                }

	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }


	    }

	}
