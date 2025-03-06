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
    private int projectId;
    private String projectName;
    private String description;
    private String status;
    private Date estimatedLaunch;

    public startupProjectDTO() {
        this.projectName = "";
        this.description = "";
    }

    public startupProjectDTO(int projectId, String projectName, String description, String status, Date estimatedLaunch) {
        this.projectId = projectId;
        this.projectName = projectName;
        this.description = description;
        this.status = status;
        this.estimatedLaunch = estimatedLaunch;
    }

    public startupProjectDTO(String project_name, String description, String status, Date estimatedLaunch) {
        this.projectName = project_name;
        this.description = description;
        this.status = status;
        this.estimatedLaunch = estimatedLaunch;
    }

    public int getProjectId() {
        return projectId;
    }

    public void setProjectId(int projectId) {
        this.projectId = projectId;
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
        this.status = status;
    }

    public Date getEstimatedLaunch() {
        return estimatedLaunch;
    }

    public void setEstimatedLaunch(Date estimatedLaunch) {
        this.estimatedLaunch = estimatedLaunch;
    }
}