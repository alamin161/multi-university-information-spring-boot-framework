package com.finalproject.demo.controller;

import com.finalproject.demo.model.DepartmentType;
import com.finalproject.demo.service.DepartmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class DepartmentTypeController {
    @Autowired
    DepartmentTypeService departmentTypeService;

    @RequestMapping(value = "/department-type")
    public String showDepartmentType(){
        return "viewDepartmentType";
    }

    @RequestMapping(value="/save-department-type", method = RequestMethod.POST)
    public @ResponseBody String savePrivateVarsity(@RequestBody DepartmentType departmentType ) {

        if(departmentType.getTmpId() > 0) {
            DepartmentType existingDepartmentType = departmentTypeService.findById(departmentType.getTmpId());

            existingDepartmentType.setDepartmentName(departmentType.getDepartmentName());
            existingDepartmentType.setDepartmentNickname(departmentType.getDepartmentNickname());
            existingDepartmentType.setFacultyName(departmentType.getFacultyName());
            existingDepartmentType.setFacultyNickname(departmentType.getFacultyNickname());

            departmentTypeService.add(existingDepartmentType);
            return "Data Updated Successfully.";
        }
        else {
            departmentTypeService.add(departmentType);
            return "Record Saved Successfully.";
        }
    }

    @RequestMapping(value="/view-all-department-type", method = RequestMethod.POST)
    public @ResponseBody
    List< DepartmentType > vieAllDepartmentType() {
        return departmentTypeService.showAllDepartmentType();
    }

    @RequestMapping(value="/delete-department-info", method = RequestMethod.POST)
    public @ResponseBody String deleteDepartmentInfo(@RequestParam("id") int id){
        System.out.println("id: = " + id);
        departmentTypeService.delete(id);
        return "Record Deleted Successfully.";
    }
}
