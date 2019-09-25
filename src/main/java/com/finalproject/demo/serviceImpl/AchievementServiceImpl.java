package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.Achievement;
import com.finalproject.demo.repository.AchievementRepository;
import com.finalproject.demo.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AchievementServiceImpl implements AchievementService {
    @Autowired
    AchievementRepository achievementRepository;

    @Override
    public void add(Achievement achievement) {
        achievementRepository.save(achievement);
    }

    @Override
    public void update(Achievement achievement) {
        achievementRepository.save(achievement);
    }

    @Override
    public void delete(int id) {
        achievementRepository.deleteById(id);
    }

    @Override
    public Achievement findById(int id) {
        return achievementRepository.getOne(id);
    }

    @Override
    public List<Achievement> showAllAchievement() {
        return achievementRepository.findAll();
    }

    @Override
    public List<Achievement> getAllPublicUniversityAchievement() {
        return achievementRepository.getAllPublicUniversityAchievement();
    }

    @Override
    public List<Achievement> getAllEngineeringUniversityAchievement() {
        return achievementRepository.getAllEngineeringUniversityAchievement();
    }

    @Override
    public List<Achievement> getAllPublicMedicalCollegeAchievement() {
        return achievementRepository.getAllPublicMedicalCollegeAchievement();
    }

    @Override
    public List<Achievement> getAllPrivateUniversityAchievement() {
        return achievementRepository.getAllPrivateUniversityAchievement();
    }

    @Override
    public List<Achievement> getAllPrivateMedicalCollegeAchievement() {
        return achievementRepository.getAllPrivateMedicalCollegeAchievement();
    }
}
