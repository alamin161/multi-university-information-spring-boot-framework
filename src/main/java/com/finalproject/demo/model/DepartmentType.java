package com.finalproject.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property = "id")
@Table(name = "department_type")
public class DepartmentType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private Integer tmpId;

    @Column(name = "departmentName")
    private String departmentName;

    @Column(name = "departmentNickname")
    private String departmentNickname;

    @Column(name = "facultyName")
    private String facultyName;

    @Column(name = "facultyNickname")
    private String facultyNickname;

    @Column(name = "createdBy")
    private Long createdBy;

    public DepartmentType() {
    }

    public DepartmentType(String departmentName, String departmentNickname, String facultyName, String facultyNickname, Long createdBy) {
        this.departmentName = departmentName;
        this.departmentNickname = departmentNickname;
        this.facultyName = facultyName;
        this.facultyNickname = facultyNickname;
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

    public String getFacultyName() {
        return facultyName;
    }

    public void setFacultyName(String facultyName) {
        this.facultyName = facultyName;
    }

    public String getFacultyNickname() {
        return facultyNickname;
    }

    public void setFacultyNickname(String facultyNickname) {
        this.facultyNickname = facultyNickname;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDepartmentNickname() {
        return departmentNickname;
    }

    public void setDepartmentNickname(String departmentNickname) {
        this.departmentNickname = departmentNickname;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "DepartmentType{" +
                "id=" + id +
                ", departmentName='" + departmentName + '\'' +
                ", departmentNickname='" + departmentNickname + '\'' +
                ", facultyName='" + facultyName + '\'' +
                ", facultyNickname='" + facultyNickname + '\'' +
                ", createdBy=" + createdBy +
                '}';
    }
}
