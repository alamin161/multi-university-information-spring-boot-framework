package com.finalproject.demo.model;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.Date;

@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class,property = "id")
@Table(name = "achievement")
public class Achievement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Transient
    private Integer tmpId;

    @Column(name = "achievementTitle")
    private String achievementTitle;

    @Column(name = "fkVarsity_type")
    private int fkVarsityType;

    @Column(name = "fkVarsity_name")
    private int fkVarsityName;

    @Column(name = "competitionPosition")
    private String competitionPosition;

    @Column(name = "competitionTitle")
    private String competitionTitle;

    @Column(name = "competitionPlace")
    private String competitionPlace;

    @Column(name = "competitionDate")
    private String competitionDate;

    @Column(name = "createdBy")
    private Long createdBy;

    public Achievement(){}

    public Achievement(String achievementTitle, int fkVarsityType, int fkVarsityName, String competitionPosition, String competitionTitle, String competitionPlace, String competitionDate, Long createdBy) {
        this.achievementTitle = achievementTitle;
        this.fkVarsityType = fkVarsityType;
        this.fkVarsityName = fkVarsityName;
        this.competitionPosition = competitionPosition;
        this.competitionTitle = competitionTitle;
        this.competitionPlace = competitionPlace;
        this.competitionDate = competitionDate;
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

    public String getAchievementTitle() {
        return achievementTitle;
    }

    public void setAchievementTitle(String achievementTitle) {
        this.achievementTitle = achievementTitle;
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

    public String getCompetitionPosition() {
        return competitionPosition;
    }

    public void setCompetitionPosition(String competitionPosition) {
        this.competitionPosition = competitionPosition;
    }

    public String getCompetitionTitle() {
        return competitionTitle;
    }

    public void setCompetitionTitle(String competitionTitle) {
        this.competitionTitle = competitionTitle;
    }

    public String getCompetitionPlace() {
        return competitionPlace;
    }

    public void setCompetitionPlace(String competitionPlace) {
        this.competitionPlace = competitionPlace;
    }

    public String getCompetitionDate() {
        return competitionDate;
    }

    public void setCompetitionDate(String competitionDate) {
        this.competitionDate = competitionDate;
    }

    public Long getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(Long createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "Achievement{" +
                "id=" + id +
                ", achievementTitle='" + achievementTitle + '\'' +
                ", fkVarsityType=" + fkVarsityType +
                ", fkVarsityName=" + fkVarsityName +
                ", competitionPosition='" + competitionPosition + '\'' +
                ", competitionTitle='" + competitionTitle + '\'' +
                ", competitionPlace='" + competitionPlace + '\'' +
                ", competitionDate=" + competitionDate +
                ", createdBy=" + createdBy +
                '}';
    }
}
