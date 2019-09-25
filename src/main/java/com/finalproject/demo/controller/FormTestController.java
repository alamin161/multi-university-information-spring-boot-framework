package com.finalproject.demo.controller;

import com.finalproject.demo.model.FormTest;
import com.finalproject.demo.service.FormTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class FormTestController {
    @Autowired
    private FormTestService formTestService;
    @RequestMapping(value = "/formtest")
    public String showAchievementPage(){
        return "viewFormTest";
    }

    @RequestMapping(value="/save-form-test", method = RequestMethod.POST)
    public @ResponseBody String saveForm(@RequestBody FormTest formTest) {
        if(formTest.getTmpId() > 0) {
            FormTest existingForm = formTestService.findById(formTest.getTmpId());
            existingForm.setField(formTest.getField());

            formTestService.add(existingForm);
            return "Data Updated Successfully.";
        }
        else {
            formTestService.add(formTest);
            return "Record Saved Successfully.";
        }
    }
    @RequestMapping(value="/view-all-form-test", method = RequestMethod.POST)
    public @ResponseBody
    List< FormTest > viewAllForm() {
        return formTestService.showAllFormTest();
    }
    @RequestMapping(value="/delete-form", method = RequestMethod.POST)
    public @ResponseBody String deleteForm(@RequestParam("id") int id){
        System.out.println("id: = " + id);
        formTestService.delete(id);
        return "Record Deleted Successfully.";
    }
}
