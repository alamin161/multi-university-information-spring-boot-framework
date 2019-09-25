package com.finalproject.demo.repository;

import com.finalproject.demo.model.University;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface UniversityRepository extends JpaRepository <University, Integer > {
    /*List<University> findUniversityByFkUniversityType(Integer universityTypeId);*/

    @Query("SELECT uni FROM University uni where uni.fkUniversityType = 11")
    List<University> getAllPublicUniversity();

    @Query("SELECT uni FROM University uni where uni.fkUniversityType = 13")
    List<University>getAllEngineeringUniversity();

    @Query("SELECT uni FROM University uni where uni.fkUniversityType = 15")
    List<University>getAllPublicMedicalCollege();

    @Query("SELECT uni FROM University uni where uni.fkUniversityType = 12")
    List<University>getAllPrivateUniversity();

    @Query("SELECT uni FROM University uni where uni.fkUniversityType = 14")
    List<University>getAllPrivateMedicalCollege();

    /*// count database data
    @Query("SELECT COUNT(u) FROM User u")
    List<University>getAllData();*/
}
