/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class startupProjectDTO {
    private int projectID;
    private String projectName;
    private String description;
    private String status;
    private Date estimatedLaunch;

    public startupProjectDTO() {
    }

    public startupProjectDTO(int projectID, String projectName, String description, String status, Date estimatedLaunch) {
        this.projectID = projectID;
        this.projectName = projectName;
        this.description = description;
        this.status = status;
        this.estimatedLaunch = estimatedLaunch;
    }

    public int getProjectID() {
        return projectID;
    }

    public void setProjectID(int projectID) {
        this.projectID = projectID;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String Description) {
        this.description = Description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String Status) {
        if(status.equals("Ideation") || status.equals("Development") || status.equals("Launch") || status.equals("Scaling")){
            this.status = status;
        } else {
            throw new IllegalArgumentException("Invalid status value");
        }
    }

    public Date getEstimatedLaunch() {
        return estimatedLaunch;
    }

    public void setEstimatedLaunch(Date estimatedLaunch) {
        this.estimatedLaunch = estimatedLaunch;
    }
}