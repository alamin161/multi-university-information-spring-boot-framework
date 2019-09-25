package com.finalproject.demo.controller;

import com.finalproject.demo.model.Teacher;
import com.finalproject.demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
public class TeacherController {
    /*public static String uploadDirectory = System.getProperty("user.dir")+"/uploads";*/

    @Autowired
    TeacherService teacherService;

    @RequestMapping(value = "/teacher")
    public String showTeacherPage(){
        return "viewTeacher";
    }
    /*file upload start*//*
    @RequestMapping("/upload")
    public String upload(Model model, @RequestParam("files") MultipartFile[] files) {
        StringBuilder fileNames = new StringBuilder();
        for (MultipartFile file : files) {
            Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
            fileNames.append(file.getOriginalFilename()+" ");
            try {
                Files.write(fileNameAndPath, file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        model.addAttribute("msg", "Successfully uploaded files "+fileNames.toString());
        return "test";
    }*//*file upload end*/

    @RequestMapping(value="/save-teacher", method = RequestMethod.POST)
    public @ResponseBody
    String saveTeacher(@RequestBody Teacher teacher) {

        if(teacher.getTmpId() > 0) {
            Teacher existingTeacher = teacherService.findById(teacher.getTmpId());

            existingTeacher.setName(teacher.getName());
            existingTeacher.setEmail(teacher.getEmail());
            existingTeacher.setFkUniversityName(teacher.getFkUniversityName());
            existingTeacher.setFkUniversityType(teacher.getFkUniversityType());
            existingTeacher.setSkill(teacher.getSkill());
            existingTeacher.setGraduation(teacher.getGraduation());
            existingTeacher.setAchievement(teacher.getAchievement());
            existingTeacher.setLink(teacher.getLink());
            existingTeacher.setFkDepartmentAbbreviation(teacher.getFkDepartmentAbbreviation());
            existingTeacher.setFkDepartmentName(teacher.getFkDepartmentName());
            existingTeacher.setFkFacultyAbbreviation(teacher.getFkFacultyAbbreviation());
            existingTeacher.setFkFacultyName(teacher.getFkFacultyName());
            /*existingTeacher.setPhoto(teacher.getPhoto());*/

            teacherService.add(existingTeacher);
            return "Data Updated Successfully.";
        }
        else {
            teacherService.add(teacher);
            return "Record Saved Successfully.";
        }
        /*teacherService.add(teacher);
        return "Data Successfully Saved";*/
    }
    @RequestMapping(value="/view-all-teacher", method = RequestMethod.POST)
    public @ResponseBody
    List<Teacher> viewTeacher() {
        return teacherService.showAllTeacher();
    }

    @RequestMapping(value = "/get-all-public-university-teacher")
    public @ResponseBody List<Teacher> viewAllPublicUniversityTeacher(){
        return teacherService.getAllPublicUniversityTeacher();
    }

    @RequestMapping(value = "/get-all-engineering-university-teacher")
    public @ResponseBody List<Teacher> viewAllEngineeringUniversityTeacher(){
        return teacherService.getAllEngineeringUniversityTeacher();
    }

    @RequestMapping(value = "/get-all-private-medical-college-teacher")
    public @ResponseBody List<Teacher> viewAllPrivateMedicalTeacher(){
        return teacherService.getAllPrivateMedicalCollegeTeacher();
    }
    @RequestMapping(value = "/get-all-public-medical-college-teacher")
    public @ResponseBody List<Teacher> viewAllPublicMedicalTeacher(){
        return teacherService.getAllPublicMedicalCollegeTeacher();
    }
    @RequestMapping(value = "/get-all-private-university-teacher")
    public @ResponseBody List<Teacher> viewAllPrivateVarsityTeacher(){
        return teacherService.getAllPrivateUniversityTeacher();
    }
}
