package com.finalproject.demo.service;

import com.finalproject.demo.model.University;

import java.util.List;

public interface UniversityService {
    void add(University university);
    void update(University university);
    void delete(int id);
    University findById(int id);
    List < University > showAllUniversity();
    /*List<University> findUniversityByFkUniversityType(Integer universityTypeId);*/
    List<University> getAllPublicUniversity();
    List<University>getAllEngineeringUniversity();
    List<University>getAllPublicMedicalCollege();
    List<University>getAllPrivateUniversity();
    List<University>getAllPrivateMedicalCollege();

    ////pie chart
    //public Iterable<University>findAll();

    // count database data
    //List<University>getAllData();

}
