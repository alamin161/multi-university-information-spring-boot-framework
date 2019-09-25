package com.finalproject.demo.controller;

import com.finalproject.demo.repository.UniversityRepository;
import com.finalproject.demo.repository.UniversityTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
    /*@Autowired
    UniversityTypeRepository universityTypeRepository;
    @Autowired
    UniversityRepository universityRepository;

    @RequestMapping("/ke")
    public String dashboardPageListClasses(Model model) {
        model.addAttribute("classes", universityTypeRepository.findAll());
        model.addAttribute("count", universityRepository.count());
        //model.addAttribute("professor", professorRepository.findAll());
        return "viewKisu";
    }*/
}
