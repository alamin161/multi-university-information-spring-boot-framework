package com.finalproject.demo.repository;

import com.finalproject.demo.model.UniversityType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UniversityTypeRepository extends JpaRepository < UniversityType, Integer > {

    // count database data
    /*@Query("SELECT COUNT(u) FROM UniversityType u")
    List<UniversityType> getAllData();*/
}
