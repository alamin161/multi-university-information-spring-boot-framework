package com.finalproject.demo.service;

import com.finalproject.demo.model.Teacher;

import java.util.List;

public interface TeacherService {
    void add(Teacher teacher);
    void update(Teacher teacher);
    void delete(int id);
    Teacher findById(int id);
    List < Teacher > showAllTeacher();

    List<Teacher> getAllPublicUniversityTeacher();
    List<Teacher>getAllEngineeringUniversityTeacher();
    List<Teacher>getAllPublicMedicalCollegeTeacher();
    List<Teacher>getAllPrivateUniversityTeacher();
    List<Teacher>getAllPrivateMedicalCollegeTeacher();
}
