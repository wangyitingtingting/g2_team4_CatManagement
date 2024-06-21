package Dto;

public class Admin {
    private Long manageId;
    private String manageTel;
    private String manageGender;
    private String manageName;
    private String managePassword;

    public String getManagePassword() {
        return managePassword;
    }

    public void setManagePassword(String managePassword) {
        this.managePassword = managePassword;
    }

    public Long getManageId() {
        return manageId;
    }

    public void setManageId(Long manageId) {
        this.manageId = manageId;
    }

    public String getManageTel() {
        return manageTel;
    }

    public void setManageTel(String manageTel) {
        this.manageTel = manageTel;
    }

    public String getManageGender() {
        return manageGender;
    }

    public void setManageGender(String manageGender) {
        this.manageGender = manageGender;
    }

    public String getManageName() {
        return manageName;
    }

    public void setManageName(String manageName) {
        this.manageName = manageName;
    }
}
