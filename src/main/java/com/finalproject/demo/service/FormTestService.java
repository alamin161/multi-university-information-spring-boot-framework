package com.finalproject.demo.service;

import com.finalproject.demo.model.FormTest;

import java.util.List;

public interface FormTestService {
    void add(FormTest formTest);
    void update(FormTest formTest);
    void delete(int id);
    FormTest findById(int id);
    List< FormTest > showAllFormTest();
}
