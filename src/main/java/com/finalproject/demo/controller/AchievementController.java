package com.finalproject.demo.controller;

import com.finalproject.demo.model.Achievement;
import com.finalproject.demo.service.AchievementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AchievementController {
    @Autowired
    AchievementService achievementService;

    @RequestMapping(value = "/achievement")
    public String showAchievementPage(){
        return "viewAchievement";
    }

    @RequestMapping(value="/save-achievement", method = RequestMethod.POST)
    public @ResponseBody
    String saveAchievement(@RequestBody Achievement achievement) {

        if (achievement.getTmpId() > 0){
            Achievement existingachievement = achievementService.findById(achievement.getTmpId());

            existingachievement.setAchievementTitle(achievement.getAchievementTitle());
            existingachievement.setFkVarsityType(achievement.getFkVarsityType());
            existingachievement.setFkVarsityName(achievement.getFkVarsityName());
            existingachievement.setCompetitionPosition(achievement.getCompetitionPosition());
            existingachievement.setCompetitionPlace(achievement.getCompetitionPlace());
            existingachievement.setCompetitionTitle(achievement.getCompetitionTitle());
            existingachievement.setCompetitionDate(achievement.getCompetitionDate());

            achievementService.add(existingachievement);
            return "Record Updated Successfully";
        }
        else{
            achievementService.add(achievement);
            return "Data Successfully Saved";
        }
    }
    @RequestMapping(value="/view-all-achievement", method = RequestMethod.POST)
    public @ResponseBody
    List< Achievement > viewAchievement() {
        return achievementService.showAllAchievement();
    }

    @RequestMapping(value = "/get-all-public-university-achievement")
    public @ResponseBody List<Achievement> viewAllPublicUniversityAchievement(){
        return achievementService.getAllPublicUniversityAchievement();
    }

    @RequestMapping(value = "/get-all-engineering-university-achievement")
    public @ResponseBody List<Achievement> viewAllEngineeringUniversityAchievement(){
        return achievementService.getAllEngineeringUniversityAchievement();
    }

    @RequestMapping(value = "/get-all-private-medical-college-achievement")
    public @ResponseBody List<Achievement> viewAllPrivateMedicalAchievement(){
        return achievementService.getAllPrivateMedicalCollegeAchievement();
    }
    @RequestMapping(value = "/get-all-public-medical-college-achievement")
    public @ResponseBody List<Achievement> viewAllPublicMedicalAchievement(){
        return achievementService.getAllPublicMedicalCollegeAchievement();
    }
    @RequestMapping(value = "/get-all-private-university-achievement")
    public @ResponseBody List<Achievement> viewAllPrivateVarsityAchievement(){
        return achievementService.getAllPrivateUniversityAchievement();
    }
}
