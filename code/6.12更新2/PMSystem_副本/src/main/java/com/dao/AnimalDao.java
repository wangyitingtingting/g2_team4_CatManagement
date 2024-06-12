package com.dao;

import java.util.List;

import com.pojo.Animal;

public interface AnimalDao {

	 //查询所有，返回一个集合，不需要参数
    public List<Animal> selectAllAnimal(String animalType, String animalGender);


    //添加
    public void insertAnimal(Animal animal);


    //删除
    public void delectById(int id);


    //修改
    public Animal selectAnimalById(int id);



    //修改后台实现
    public  void updateAnimalById(Animal animal);

}
