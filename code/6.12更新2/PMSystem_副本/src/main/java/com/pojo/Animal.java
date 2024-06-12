package com.pojo;

import java.io.Serializable;

public class Animal implements Serializable{

	private String AnimalName;
    public String getAnimalName() {
		return AnimalName;
	}
	public void setAnimalName(String animalName) {
		AnimalName = animalName;
	}
	public String getAnimalType() {
		return AnimalType;
	}
	public void setAnimalType(String animalType) {
		AnimalType = animalType;
	}
	public String getAnimalGender() {
		return AnimalGender;
	}
	public void setAnimalGender(String animalGender) {
		AnimalGender = animalGender;
	}
	public String getHealth() {
		return Health;
	}
	public void setHealth(String health) {
		Health = health;
	}
	public String getLYStatus() {
		return LYStatus;
	}
	public void setLYStatus(String lYStatus) {
		LYStatus = lYStatus;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	public String getPicAnimal() {
		return PicAnimal;
	}
	public void setPicAnimal(String picAnimal) {
		PicAnimal = picAnimal;
	}
	private int AnimalId;
	public int getAnimalId() {
		return AnimalId;
	}
	public void setAnimalId(int animalId) {
		AnimalId = animalId;
	}
	private String AnimalType;
    private String AnimalGender;
    private String Health;
    private String LYStatus;
    private int Age;
    private String PicAnimal;
    }

   