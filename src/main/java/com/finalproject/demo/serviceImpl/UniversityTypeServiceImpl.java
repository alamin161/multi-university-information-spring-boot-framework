package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.UniversityType;
import com.finalproject.demo.repository.UniversityTypeRepository;
import com.finalproject.demo.service.UniversityTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UniversityTypeServiceImpl implements UniversityTypeService {
    @Autowired
    UniversityTypeRepository universityTypeRepository;

    @Override
    public void add(UniversityType universityType) {
        universityTypeRepository.save(universityType);
    }

    @Override
    public void update(UniversityType universityType) {
        universityTypeRepository.save(universityType);
    }

    @Override
    public void delete(int id) {
        universityTypeRepository.deleteById(id);
    }

    @Override
    public UniversityType findById(int id) {
        return universityTypeRepository.getOne(id);
    }

    @Override
    public List<UniversityType> showAllUniversityType() {
        return universityTypeRepository.findAll();
    }

    // count data from database
    /*@Override
    public List<UniversityType> getAllData() {
        return universityTypeRepository.getAllData();
    }*/
}
