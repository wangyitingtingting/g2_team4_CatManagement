package com.service;

import java.util.List;

import com.pojo.Animal;

public interface AnimalService {

	  public List<Animal> selectAllAnimal();

	    //添加
	    public void insertAnimal(Animal animal);

	    //删除
	    public void delectById(int id);



	    //修改
	    public Animal queryAnimalById(int id);


	    //修改后台实现
	    public  void updateAnimalById(Animal animal);

	}


