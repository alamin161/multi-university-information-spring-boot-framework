package com.finalproject.demo.serviceImpl;

import com.finalproject.demo.model.FormTest;
import com.finalproject.demo.repository.FormTestRepository;
import com.finalproject.demo.service.FormTestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FormTestServiceImpl implements FormTestService {
    @Autowired
    FormTestRepository formTestRepository;
    @Override
    public void add(FormTest formTest) {
        formTestRepository.save(formTest);
    }

    @Override
    public void update(FormTest formTest) {
        formTestRepository.save(formTest);
    }

    @Override
    public void delete(int id) {
        formTestRepository.deleteById(id);
    }

    @Override
    public FormTest findById(int id) {
        return formTestRepository.getOne(id);
    }

    @Override
    public List<FormTest> showAllFormTest() {
        return formTestRepository.findAll();
    }
}
