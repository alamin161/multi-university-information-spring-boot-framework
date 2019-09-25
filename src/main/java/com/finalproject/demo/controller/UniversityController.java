package com.finalproject.demo.controller;

import com.finalproject.demo.model.University;
import com.finalproject.demo.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UniversityController {
    @Autowired
    UniversityService universityService;

    @RequestMapping(value = "/university")
    public String showUniversityPage(){
        return "viewUnivarsity";
    }

    @RequestMapping(value="/save-university", method = RequestMethod.POST)
    public @ResponseBody
    String saveUniversity(@RequestBody University university) {

        if(university.getTmpId() > 0) {
            University existingUniversity = universityService.findById(university.getTmpId());
            existingUniversity.setVarsityName(university.getVarsityName());
            existingUniversity.setVarsityNickname(university.getVarsityNickname());
            existingUniversity.setFkUniversityType(university.getFkUniversityType());
            existingUniversity.setCampus(university.getCampus());

            universityService.add(existingUniversity);
            return "Data Successfully Updated";
        }else {
            universityService.add(university);
            return "Record Saved Successfully.";

        }

        /*universityService.add(university);
        return "Data Successfully Saved";*/

    }
    @RequestMapping(value="/view-all-university", method = RequestMethod.POST)
    public @ResponseBody
    List<University> viewUnivarsity() {
        return universityService.showAllUniversity();
    }

    /*@RequestMapping(value = "/view-university-by-university-type")
    public @ResponseBody List<University> viewUniversityByUniversityType(@RequestParam("universityTypeId") Integer universityTypeId){
        return universityService.findUniversityByFkUniversityType(universityTypeId);
        }*/


    @RequestMapping(value = "/get-all-public-university")
    public @ResponseBody List<University> viewAllPublicUniversity(){
        return universityService.getAllPublicUniversity();
    }

    @RequestMapping(value = "/get-all-engineering-university")
    public @ResponseBody List<University> viewAllEngineeringUniversity(){
        return universityService.getAllEngineeringUniversity();
    }

    @RequestMapping(value = "/get-all-private-medical-college")
    public @ResponseBody List<University> viewAllPrivateMedical(){
        return universityService.getAllPrivateMedicalCollege();
    }
    @RequestMapping(value = "/get-all-public-medical-college")
    public @ResponseBody List<University> viewAllPublicMedical(){
        return universityService.getAllPublicMedicalCollege();
    }
    @RequestMapping(value = "/get-all-private-university")
    public @ResponseBody List<University> viewAllPrivateVarsity(){
        return universityService.getAllPrivateUniversity();
    }

    /////pie chart
    /*@RequestMapping(value = "/findall",method = RequestMethod.GET,
            produces = {MimeTypeUtils.APPLICATION_JSON_VALUE})
    public ResponseEntity<Iterable<University>> findAll(){
        try {
            return new ResponseEntity<Iterable<University>>(universityService.findAll(), HttpStatus.OK);
        }catch (Exception e){
            return new ResponseEntity<Iterable<University>>(HttpStatus.BAD_REQUEST);
        }
    }*/

    /*@RequestMapping(value = "/product",method = RequestMethod.GET)
    public String showChart(){
        return "product/home";
    }*/

    /// count database data
    /* @RequestMapping(value = "/showAllData")
    public @ResponseBody List<University> viewAllData(){
         return universityService.getAllData();
     }*/
}
