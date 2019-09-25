package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.Teacher;
import com.finalproject.demo.repository.TeacherRepository;
import com.finalproject.demo.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    TeacherRepository teacherRepository;

    @Override
    public void add(Teacher teacher) {
        teacherRepository.save(teacher);
    }

    @Override
    public void update(Teacher teacher) {
        teacherRepository.save(teacher);
    }

    @Override
    public void delete(int id) {
        teacherRepository.deleteById(id);
    }

    @Override
    public Teacher findById(int id) {
        return teacherRepository.getOne(id);
    }

    @Override
    public List<Teacher> showAllTeacher() {
        return teacherRepository.findAll();
    }

    @Override
    public List<Teacher> getAllPublicUniversityTeacher() {
        return teacherRepository.getAllPublicUniversityTeacher();
    }

    @Override
    public List<Teacher> getAllEngineeringUniversityTeacher() {
        return teacherRepository.getAllEngineeringUniversityTeacher();
    }

    @Override
    public List<Teacher> getAllPublicMedicalCollegeTeacher() {
        return teacherRepository.getAllPublicMedicalCollegeTeacher();
    }

    @Override
    public List<Teacher> getAllPrivateUniversityTeacher() {
        return teacherRepository.getAllPrivateUniversityTeacher();
    }

    @Override
    public List<Teacher> getAllPrivateMedicalCollegeTeacher() {
        return teacherRepository.getAllPrivateMedicalCollegeTeacher();
    }
}
