package com.finalproject.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property = "id")
@Table(name = "university_type")
public class UniversityType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private Integer tmpId;

    @Column(name = "uniVersityType")
    private String uniVersityType;

    @Column(name = "createdBy")
    private Long createdBy;

    public UniversityType(){}

    public UniversityType(String uniVersityType, Long createdBy) {
        this.uniVersityType = uniVersityType;
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

    public String getUniVersityType() {
        return uniVersityType;
    }

    public void setUniVersityType(String uniVersityType) {
        this.uniVersityType = uniVersityType;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "UniversityType{" +
                "id=" + id +
                ", uniVersityType='" + uniVersityType + '\'' +
                ", createdBy=" + createdBy +
                '}';
    }
}
