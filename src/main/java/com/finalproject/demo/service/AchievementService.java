package com.finalproject.demo.service;

import com.finalproject.demo.model.Achievement;

import java.util.List;

public interface AchievementService {
    void add(Achievement achievement);
    void update(Achievement achievement);
    void delete(int id);
    Achievement findById(int id);
    List < Achievement > showAllAchievement();

    List<Achievement> getAllPublicUniversityAchievement();
    List<Achievement>getAllEngineeringUniversityAchievement();
    List<Achievement>getAllPublicMedicalCollegeAchievement();
    List<Achievement>getAllPrivateUniversityAchievement();
    List<Achievement>getAllPrivateMedicalCollegeAchievement();
}
