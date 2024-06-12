package Dto;

public class Adopt {
    private int id;
    private String userName;
    private String animalName;
    private String reason;
    private String experience;
    private String approved;

    public Adopt(int id, String userName, String animalName, String reason, String experience, String approved) {
        this.id = id;
        this.userName = userName;
        this.animalName = animalName;
        this.reason = reason;
        this.experience = experience;
        this.approved = approved;
    }

    public Adopt(String userName, String animalName, String reason, String experience) {
        this.userName = userName;
        this.animalName = animalName;
        this.reason = reason;
        this.experience = experience;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getAnimalName() {
        return animalName;
    }

    public void setAnimalName(String animalName) {
        this.animalName = animalName;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getApproved() {
        return approved;
    }

    public void setApproved(String approved) {
        this.approved = approved;
    }
}
