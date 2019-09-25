package com.finalproject.demo.repository;

import com.finalproject.demo.model.DepartmentType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DepartmentTypeRepository extends JpaRepository <DepartmentType, Integer> {
}
