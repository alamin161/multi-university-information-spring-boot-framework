package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.Research;
import com.finalproject.demo.repository.ResearchRepository;
import com.finalproject.demo.service.ResearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResearchServiceImpl implements ResearchService {

    @Autowired
    ResearchRepository researchRepository;

    @Override
    public void add(Research research) {
        researchRepository.save(research);
    }

    @Override
    public void update(Research research) {
        researchRepository.save(research);
    }

    @Override
    public void delete(int id) {
        researchRepository.deleteById(id);
    }

    @Override
    public Research findById(int id) {
        return researchRepository.getOne(id);
    }

    @Override
    public List<Research> showAllResearch() {
        return researchRepository.findAll();
    }

    @Override
    public List<Research> getAllPublicUniversityResearch() {
        return researchRepository.getAllPublicUniversityResearch();
    }

    @Override
    public List<Research> getAllEngineeringUniversityResearch() {
        return researchRepository.getAllEngineeringUniversityResearch();
    }

    @Override
    public List<Research> getAllPublicMedicalCollegeResearch() {
        return researchRepository.getAllPublicMedicalCollegeResearch();
    }

    @Override
    public List<Research> getAllPrivateUniversityResearch() {
        return researchRepository.getAllPrivateUniversityResearch();
    }

    @Override
    public List<Research> getAllPrivateMedicalCollegeResearch() {
        return researchRepository.getAllPrivateMedicalCollegeResearch();
    }

    /*@Override
    public List<Research> findUniversityNameByFkVarsityType(Integer universityTypeId) {
        return researchRepository.findUniversityNameByFkVarsityType(universityTypeId);
    }*/


}
