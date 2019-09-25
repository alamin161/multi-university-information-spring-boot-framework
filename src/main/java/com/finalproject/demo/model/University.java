package com.finalproject.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property = "id")
@Table(name = "university")
public class University {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private Integer tmpId;

    @Column(name = "varsity_name")
    private String varsityName;

    @Column(name = "varsity_nickname")
    private String varsityNickname;

    @Column(name = "campus")
    private String campus;

    @Column(name = "fkUniversity_type")
    private Integer fkUniversityType;

    @Column(name = "createdBy")
    private Long createdBy;

    public University() {}

    public University(Integer tmpId, String varsityName, String varsityNickname, String campus, Integer fkUniversityType, Long createdBy) {
        this.tmpId = tmpId;
        this.varsityName = varsityName;
        this.varsityNickname = varsityNickname;
        this.campus = campus;
        this.fkUniversityType = fkUniversityType;
        this.createdBy = createdBy;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTmpId() {
        return tmpId;
    }

    public void setTmpId(Integer tmpId) {
        this.tmpId = tmpId;
    }

    public String getVarsityName() {
        return varsityName;
    }

    public void setVarsityName(String varsityName) {
        this.varsityName = varsityName;
    }

    public String getVarsityNickname() {
        return varsityNickname;
    }

    public void setVarsityNickname(String varsityNickname) {
        this.varsityNickname = varsityNickname;
    }

    public String getCampus() {
        return campus;
    }

    public void setCampus(String campus) {
        this.campus = campus;
    }

    public Integer getFkUniversityType() {
        return fkUniversityType;
    }

    public void setFkUniversityType(Integer fkUniversityType) {
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
        return "University{" +
                "id=" + id +
                ", tmpId=" + tmpId +
                ", varsityName='" + varsityName + '\'' +
                ", varsityNickname='" + varsityNickname + '\'' +
                ", campus='" + campus + '\'' +
                ", fkUniversityType=" + fkUniversityType +
                ", createdBy=" + createdBy +
                '}';
    }
}