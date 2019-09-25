package com.finalproject.demo.service;

import com.finalproject.demo.model.UniversityType;

import java.util.List;

public interface UniversityTypeService {
    void add(UniversityType universityType);
    void update(UniversityType universityType);
    void delete(int id);
    UniversityType findById(int id);
    List < UniversityType > showAllUniversityType();

    // count data from database
    //List<UniversityType> getAllData();
}
