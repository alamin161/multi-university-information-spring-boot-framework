package com.finalproject.demo.repository;

import com.finalproject.demo.model.Achievement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface AchievementRepository extends JpaRepository < Achievement, Integer > {

    @Query("SELECT uni FROM Achievement uni where uni.fkVarsityType = 11")
    List<Achievement> getAllPublicUniversityAchievement();

    @Query("SELECT uni FROM Achievement uni where uni.fkVarsityType = 13")
    List<Achievement>getAllEngineeringUniversityAchievement();

    @Query("SELECT uni FROM Achievement uni where uni.fkVarsityType = 15")
    List<Achievement>getAllPublicMedicalCollegeAchievement();

    @Query("SELECT uni FROM Achievement uni where uni.fkVarsityType = 12")
    List<Achievement>getAllPrivateUniversityAchievement();

    @Query("SELECT uni FROM Achievement uni where uni.fkVarsityType = 14")
    List<Achievement>getAllPrivateMedicalCollegeAchievement();
}
