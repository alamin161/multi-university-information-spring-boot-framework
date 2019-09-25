package com.finalproject.demo.repository;

import com.finalproject.demo.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TeacherRepository extends JpaRepository < Teacher, Integer > {

    @Query("SELECT tea FROM Teacher tea where tea.fkUniversityType = 11")
    List<Teacher> getAllPublicUniversityTeacher();

    @Query("SELECT tea FROM Teacher tea where tea.fkUniversityType = 13")
    List<Teacher>getAllEngineeringUniversityTeacher();

    @Query("SELECT tea FROM Teacher tea where tea.fkUniversityType = 15")
    List<Teacher>getAllPublicMedicalCollegeTeacher();

    @Query("SELECT tea FROM Teacher tea where tea.fkUniversityType = 12")
    List<Teacher>getAllPrivateUniversityTeacher();

    @Query("SELECT tea FROM Teacher tea where tea.fkUniversityType = 14")
    List<Teacher>getAllPrivateMedicalCollegeTeacher();
}
