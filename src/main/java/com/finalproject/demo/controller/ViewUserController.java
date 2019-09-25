package com.finalproject.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewUserController {
    /*University Mapping Here*/
    @RequestMapping(value = "/public-university")
    public String showPublicVersity(){
        return "viewPublicVarsity";
    }

    @RequestMapping(value = "/private-university")
    public String showPrivateVersity(){
        return "viewPrivateUniversity";
    }

    @RequestMapping(value = "/engineering-university")
    public String showEngineeringVersity(){
        return "viewEngineeringVarsity";
    }

    @RequestMapping(value = "/public-medical-college")
    public String showPublicMedical(){
        return "viewPublicMedicalCollege";
    }

    @RequestMapping(value = "/private-medical-college")
    public String showPrivateMedical(){
        return "viewPrivateMedicalCollege";
    }

    /*Start Achievement Mapping Here*/
    @RequestMapping(value = "/public-university-achievement")
    public String showPublicVersityAchievement(){
        return "viewPublicVarsityAchievement";
    }

    @RequestMapping(value = "/private-university-achievement")
    public String showPrivateVersityAchievement(){
        return "viewPrivateUniversityAchievement";
    }

    @RequestMapping(value = "/engineering-university-achievement")
    public String showEngineeringVersityAchievement(){
        return "viewEngineeringVarsityAchievement";
    }

    @RequestMapping(value = "/public-medical-college-achievement")
    public String showPublicMedicalAchievement(){
        return "viewPublicMedicalCollegeAchievement";
    }

    @RequestMapping(value = "/private-medical-college-achievement")
    public String showPrivateMedicalAchievement(){
        return "viewPrivateMedicalCollegeAchievement";
    }
    /*End Achievement Mapping Here*/

    /*Research Mapping Start Here*/
    @RequestMapping(value = "/public-university-research")
    public String showPublicVersityResearch(){
        return "viewPublicVarsityResearch";
    }

    @RequestMapping(value = "/private-university-research")
    public String showPrivateVersityResearch(){
        return "viewPrivateUniversityResearch";
    }

    @RequestMapping(value = "/engineering-university-research")
    public String showEngineeringVersityResearch(){
        return "viewEngineeringVarsityResearch";
    }

    @RequestMapping(value = "/public-medical-college-research")
    public String showPublicMedicalResearch(){
        return "viewPublicMedicalCollegeResearch";
    }

    @RequestMapping(value = "/private-medical-college-research")
    public String showPrivateMedicalResearch(){
        return "viewPrivateMedicalCollegeResearch";
    }
    /*Research Mapping End Here*/

    /*Teacher Mapping Start Here*/
    @RequestMapping(value = "/public-university-teacher")
    public String showPublicVersityTeacher(){
        return "viewPublicVarsityTeacher";
    }

    @RequestMapping(value = "/private-university-teacher")
    public String showPrivateVersityTeacher(){
        return "viewPrivateUniversityTeacher";
    }

    @RequestMapping(value = "/engineering-university-teacher")
    public String showEngineeringVersityTeacher(){
        return "viewEngineeringVarsityTeacher";
    }

    @RequestMapping(value = "/public-medical-college-teacher")
    public String showPublicMedicalTeacher(){
        return "viewPublicMedicalCollegeTeacher";
    }

    @RequestMapping(value = "/private-medical-college-teacher")
    public String showPrivateMedicalTeacher(){
        return "viewPrivateMedicalCollegeTeacher";
    }
    /*Teacher Mapping End Here*/
}
