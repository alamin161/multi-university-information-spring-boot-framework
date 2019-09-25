package com.finalproject.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Date;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property = "id")
@Table(name = "research")
public class Research {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private Integer tmpId;

    @Column(name = "research_name")
    private String researchName;

    @Column(name = "fkVarsity_type")
    private int fkVarsityType;

    @Column(name = "fkVarsity_name")
    private int fkVarsityName;

    @Column(name = "teacherName")
    private String teacherName;

    @Column(name = "fkDepartment_name")
    private int fkDepartmentNickname;

    @Column(name = "research_published")
    private String researchPublished;

    @Column(name = "createdBy")
    private Long createdBy;

    public Research(){}

    public Research(String researchName, int fkVarsityType, int fkVarsityName, String teacherName, int fkDepartmentNickname, String researchPublished, Long createdBy) {
        this.researchName = researchName;
        this.fkVarsityType = fkVarsityType;
        this.fkVarsityName = fkVarsityName;
        this.teacherName = teacherName;
        this.fkDepartmentNickname = fkDepartmentNickname;
        this.researchPublished = researchPublished;
        this.createdBy = createdBy;
    }

    public Integer getTmpId() {
        return tmpId;
    }

    public void setTmpId(Integer tmpId) {
        this.tmpId = tmpId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getResearchName() {
        return researchName;
    }

    public void setResearchName(String researchName) {
        this.researchName = researchName;
    }

    public int getFkVarsityType() {
        return fkVarsityType;
    }

    public void setFkVarsityType(int fkVarsityType) {
        this.fkVarsityType = fkVarsityType;
    }

    public int getFkVarsityName() {
        return fkVarsityName;
    }

    public void setFkVarsityName(int fkVarsityName) {
        this.fkVarsityName = fkVarsityName;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public int getFkDepartmentNickname() {
        return fkDepartmentNickname;
    }

    public void setFkDepartmentNickname(int fkDepartmentNickname) {
        this.fkDepartmentNickname = fkDepartmentNickname;
    }

    public String getResearchPublished() {
        return researchPublished;
    }

    public void setResearchPublished(String researchPublished) {
        this.researchPublished = researchPublished;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "Research{" +
                "id=" + id +
                ", researchName='" + researchName + '\'' +
                ", fkVarsityType=" + fkVarsityType +
                ", fkVarsityName=" + fkVarsityName +
                ", teacherName='" + teacherName + '\'' +
                ", fkDepartmentNickname=" + fkDepartmentNickname +
                ", researchPublished=" + researchPublished +
                ", createdBy=" + createdBy +
                '}';
    }
}
