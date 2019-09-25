package com.finalproject.demo.repository;

import com.finalproject.demo.model.Research;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ResearchRepository extends JpaRepository <Research, Integer > {
    /*List<Research> findUniversityNameByFkVarsityType(Integer universityTypeId);*/

    @Query("SELECT res FROM Research res where res.fkVarsityType = 11")
    List<Research> getAllPublicUniversityResearch();

    @Query("SELECT res FROM Research res where res.fkVarsityType = 13")
    List<Research>getAllEngineeringUniversityResearch();

    @Query("SELECT res FROM Research res where res.fkVarsityType = 15")
    List<Research>getAllPublicMedicalCollegeResearch();

    @Query("SELECT res FROM Research res where res.fkVarsityType = 12")
    List<Research>getAllPrivateUniversityResearch();

    @Query("SELECT res FROM Research res where res.fkVarsityType = 14")
    List<Research>getAllPrivateMedicalCollegeResearch();
}
