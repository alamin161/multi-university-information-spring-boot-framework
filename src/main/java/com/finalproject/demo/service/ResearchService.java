package com.finalproject.demo.service;

import com.finalproject.demo.model.Research;


import java.util.List;

public interface ResearchService {
    void add(Research research);
    void update(Research research);
    void delete(int id);
    Research findById(int id);
    List < Research > showAllResearch();
    /*List<Research> findUniversityNameByFkVarsityType(Integer universityTypeId);*/
    List<Research> getAllPublicUniversityResearch();
    List<Research>getAllEngineeringUniversityResearch();
    List<Research>getAllPublicMedicalCollegeResearch();
    List<Research>getAllPrivateUniversityResearch();
    List<Research>getAllPrivateMedicalCollegeResearch();
}
