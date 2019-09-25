package com.finalproject.demo.service;

import com.finalproject.demo.model.DepartmentType;

import java.util.List;

public interface DepartmentTypeService {
    void add(DepartmentType departmentType);
    void update(DepartmentType departmentType);
    void delete(int id);
    DepartmentType findById(int id);
    List< DepartmentType > showAllDepartmentType();
}
