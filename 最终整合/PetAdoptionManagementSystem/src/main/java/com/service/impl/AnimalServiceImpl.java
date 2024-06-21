package com.service.impl;

import com.dao.impl.AnimalDaoImpl;
import com.pojo.Animal;
import com.service.AnimalService;

import java.util.List;


public class AnimalServiceImpl implements AnimalService {
    @Override
    public List<Animal> selectAllAnimal(String animalType, String animalGender) {
        AnimalDaoImpl animalDao = new AnimalDaoImpl();

        return animalDao.selectAllAnimal(animalType, animalGender);
    }

    @Override
    public void insertAnimal(Animal animal) {
        AnimalDaoImpl AnimalDao = new AnimalDaoImpl();

        System.out.println(animal);
        AnimalDao.insertAnimal(animal);

    }

    @Override
    public void delectById(int id) {
        AnimalDaoImpl AnimalDao = new AnimalDaoImpl();
        AnimalDao.delectById(id);
    }

    @Override
    public Animal queryAnimalById(int id) {
        AnimalDaoImpl AnimalDao = new AnimalDaoImpl();
        return AnimalDao.selectAnimalById(id);
    }

    @Override
    public void updateAnimalById(Animal animal) {
        AnimalDaoImpl AnimalDao = new AnimalDaoImpl();
        AnimalDao.updateAnimalById(animal);
    }
}
