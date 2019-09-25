package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.DepartmentType;
import com.finalproject.demo.repository.DepartmentTypeRepository;
import com.finalproject.demo.service.DepartmentTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentTypeServiceImpl implements DepartmentTypeService {
    @Autowired
    DepartmentTypeRepository departmentTypeRepository;

    @Override
    public void add(DepartmentType departmentType) {
        departmentTypeRepository.save(departmentType);
    }

    @Override
    public void update(DepartmentType departmentType) {
        departmentTypeRepository.save(departmentType);
    }

    @Override
    public void delete(int id) {
        departmentTypeRepository.deleteById(id);
    }

    @Override
    public DepartmentType findById(int id) {
        return departmentTypeRepository.getOne(id);
    }

    @Override
    public List<DepartmentType> showAllDepartmentType() {
        return departmentTypeRepository.findAll();
    }
}
