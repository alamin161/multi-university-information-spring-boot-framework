package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.University;
import com.finalproject.demo.repository.UniversityRepository;
import com.finalproject.demo.service.UniversityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UniversityServiceImpl implements UniversityService {
    @Autowired
    UniversityRepository universityRepository;

    @Override
    public void add(University university) {
        universityRepository.save(university);
    }

    @Override
    public void update(University university) {
        universityRepository.save(university);
    }

    @Override
    public void delete(int id) {
        universityRepository.deleteById(id);
    }

    @Override
    public University findById(int id) {
        return universityRepository.getOne(id);
    }

    @Override
    public List<University> showAllUniversity() {
        return universityRepository.findAll();
    }

    @Override
    public List<University> getAllPublicUniversity() {
        return universityRepository.getAllPublicUniversity();
    }

    @Override
    public List<University> getAllEngineeringUniversity() {
        return universityRepository.getAllEngineeringUniversity();
    }

    @Override
    public List<University> getAllPublicMedicalCollege() {
        return universityRepository.getAllPublicMedicalCollege();
    }

    @Override
    public List<University> getAllPrivateUniversity() {
        return universityRepository.getAllPrivateUniversity();
    }

    @Override
    public List<University> getAllPrivateMedicalCollege() {
        return universityRepository.getAllPrivateMedicalCollege();
    }

    // count database data
    /*@Override
    public List<University> getAllData() {
        return universityRepository.getAllData();
    }*/

    ///////pie chart
    /*@Override
    public Iterable<University> findAll() {
        return universityRepository.findAll();
    }*/


    /*@Override
    public List<University> findUniversityByFkUniversityType(Integer universityTypeId) {
        return universityRepository.findUniversityByFkUniversityType(universityTypeId);
    }*/


}
