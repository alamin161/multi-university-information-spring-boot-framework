package com.finalproject.demo.controller;

import com.finalproject.demo.model.UniversityType;
import com.finalproject.demo.service.UniversityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import java.util.List;

@Controller
public class UniversityTypeController {
    @Autowired
    private UniversityTypeService universityTypeService;

    @RequestMapping(value = "/university-type")
    public String showUniversityTypePage(){
        return "viewUniversityType";
    }

    @RequestMapping(value="/save-university-type", method = RequestMethod.POST)
    public @ResponseBody
    String saveUniversityType(@RequestBody UniversityType universityType) {
         if(universityType.getTmpId() > 0) {
            UniversityType existingBrands = universityTypeService.findById(universityType.getTmpId());
             existingBrands.setUniVersityType(universityType.getUniVersityType());

            universityTypeService.add(existingBrands);
            return "Data Updated Successfully.";
        }
        else {
            universityTypeService.add(universityType);
            return "Record Saved Successfully.";
        }

        /*universityTypeService.add(universityType);
        return "Data Successfully Saved";*/
    }

    @RequestMapping(value="/view-all-university-type", method = RequestMethod.POST)
    public @ResponseBody
    List < UniversityType > viewAllUniversityType() {
        return universityTypeService.showAllUniversityType();
    }

    @RequestMapping(value="/delete-university-type", method = RequestMethod.POST)
    public @ResponseBody String deleteUniversityType(@RequestParam("id") int id){
        System.out.println("id: = " + id);
        universityTypeService.delete(id);
        return "Record Deleted Successfully.";
    }
    /*@RequestMapping(value="/delete-brand", method = RequestMethod.POST)
    public @ResponseBody String deleteBrands(@RequestParam("id") int id){
        System.out.println("id: = " + id);
        universityTypeService.delete(id);
        return "Record Deleted Successfully.";
    }*/

    /// count database data
     /*@RequestMapping(value = "/ke")
    public @ResponseBody List<UniversityType> viewAllData(){
         return universityTypeService.getAllData();
     }*/
}
