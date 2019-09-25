package com.finalproject.demo.controller;

import com.finalproject.demo.model.Research;
import com.finalproject.demo.service.ResearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ResearchController {
    @Autowired
    ResearchService researchService;

    @RequestMapping(value = "/research")
    public String showResearchPage(){
        return "viewResearch";
    }

    @RequestMapping(value="/save-research", method = RequestMethod.POST)
    public @ResponseBody
    String saveResearch(@RequestBody Research research) {

        if (research.getTmpId() > 0){
            Research existingresearch = researchService.findById(research.getTmpId());

            existingresearch.setResearchName(research.getResearchName());
            existingresearch.setFkVarsityType(research.getFkVarsityType());
            existingresearch.setFkVarsityName(research.getFkVarsityName());
            existingresearch.setFkDepartmentNickname(research.getFkDepartmentNickname());
            existingresearch.setTeacherName(research.getTeacherName());
            existingresearch.setResearchPublished(research.getResearchPublished());

            researchService.add(existingresearch);
            return "Data Updated Successfully";
        }
        else {
            researchService.add(research);
            return "Record Saved Successfully";
        }
        /*researchService.add(research);
        return "Data Successfully Saved";*/
    }

    @RequestMapping(value="/view-all-research", method = RequestMethod.POST)
    public @ResponseBody
    List<Research> viewResearch() {
        return researchService.showAllResearch();
    }

    /*@RequestMapping(value = "/view-university-name-by-university-type")
    public @ResponseBody List<Research> viewUniversityNameByVarsityType(@RequestParam("universityTypeId") Integer universityTypeId){
        return researchService.findUniversityNameByFkVarsityType(universityTypeId);
    }*/

    @RequestMapping(value = "/get-all-public-university-research")
    public @ResponseBody List<Research> viewAllPublicUniversityResearch(){
        return researchService.getAllPublicUniversityResearch();
    }

    @RequestMapping(value = "/get-all-engineering-university-research")
    public @ResponseBody List<Research> viewAllEngineeringUniversityResearch(){
        return researchService.getAllEngineeringUniversityResearch();
    }

    @RequestMapping(value = "/get-all-private-medical-college-research")
    public @ResponseBody List<Research> viewAllPrivateMedicalResearch(){
        return researchService.getAllPrivateMedicalCollegeResearch();
    }
    @RequestMapping(value = "/get-all-public-medical-college-research")
    public @ResponseBody List<Research> viewAllPublicMedicalResearch(){
        return researchService.getAllPublicMedicalCollegeResearch();
    }
    @RequestMapping(value = "/get-all-private-university-research")
    public @ResponseBody List<Research> viewAllPrivateVarsityResearch(){
        return researchService.getAllPrivateUniversityResearch();
    }
	
}
