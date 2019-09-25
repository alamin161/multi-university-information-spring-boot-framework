package com.finalproject.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property = "id")
@Table(name = "teacher")
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private Integer tmpId;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "skill")
    private String skill;

    @Column(name = "graduation")
    private String graduation;

    @Column(name = "achievement")
    private String achievement;

    @Column(name = "photo")
    private String photo;

    @Column(name = "fkUniversity_name")
    private int fkUniversityName;

    @Column(name = "fkUniversity_type")
    private int fkUniversityType;

    @Column(name = "link")
    private String link;

    @Column(name = "fkFaculty_name")
    private int fkFacultyName;

    @Column(name = "fkFaculty_abbreviation")
    private int fkFacultyAbbreviation;

    @Column(name = "fkDepartment_name")
    private int fkDepartmentName;

    @Column(name = "fkDepartment_abbreviation")
    private int fkDepartmentAbbreviation;

    @Column(name = "createdBy")
    private Long createdBy;

    public Teacher(){}

    public Teacher(String name,int fkFacultyName, int fkFacultyAbbreviation, int fkDepartmentName, int fkDepartmentAbbreviation, String email,
                   String link, String skill, String graduation, String achievement, String photo, int fkUniversityName, int fkUniversityType, Long createdBy) {
        this.name = name;
        this.fkFacultyName = fkFacultyName;
        this.fkFacultyAbbreviation = fkFacultyAbbreviation;
        this.fkDepartmentName = fkDepartmentName;
        this.fkDepartmentAbbreviation = fkDepartmentAbbreviation;
        this.email = email;
        this.link = link;
        this.skill = skill;
        this.graduation = graduation;
        this.achievement = achievement;
        this.photo = photo;
        this.fkUniversityName = fkUniversityName;
        this.fkUniversityType = fkUniversityType;
        this.createdBy = createdBy;
    }

    public Integer getTmpId() {
        return tmpId;
    }

    public int getFkFacultyName() {
        return fkFacultyName;
    }

    public void setFkFacultyName(int fkFacultyName) {
        this.fkFacultyName = fkFacultyName;
    }

    public int getFkFacultyAbbreviation() {
        return fkFacultyAbbreviation;
    }

    public void setFkFacultyAbbreviation(int fkFacultyAbbreviation) {
        this.fkFacultyAbbreviation = fkFacultyAbbreviation;
    }

    public int getFkDepartmentName() {
        return fkDepartmentName;
    }

    public void setFkDepartmentName(int fkDepartmentName) {
        this.fkDepartmentName = fkDepartmentName;
    }

    public int getFkDepartmentAbbreviation() {
        return fkDepartmentAbbreviation;
    }

    public void setFkDepartmentAbbreviation(int fkDepartmentAbbreviation) {
        this.fkDepartmentAbbreviation = fkDepartmentAbbreviation;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getGraduation() {
        return graduation;
    }

    public void setGraduation(String graduation) {
        this.graduation = graduation;
    }

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getFkUniversityName() {
        return fkUniversityName;
    }

    public void setFkUniversityName(int fkUniversityName) {
        this.fkUniversityName = fkUniversityName;
    }

    public int getFkUniversityType() {
        return fkUniversityType;
    }

    public void setFkUniversityType(int fkUniversityType) {
        this.fkUniversityType = fkUniversityType;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "Teacher{" +
                "id=" + id +
                ", tmpId=" + tmpId +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", skill='" + skill + '\'' +
                ", graduation='" + graduation + '\'' +
                ", achievement='" + achievement + '\'' +
                ", photo='" + photo + '\'' +
                ", fkUniversityName=" + fkUniversityName +
                ", fkUniversityType=" + fkUniversityType +
                ", link='" + link + '\'' +
                ", fkFacultyName=" + fkFacultyName +
                ", fkFacultyAbbreviation=" + fkFacultyAbbreviation +
                ", fkDepartmentName=" + fkDepartmentName +
                ", fkDepartmentAbbreviation=" + fkDepartmentAbbreviation +
                ", createdBy=" + createdBy +
                '}';
    }
}
