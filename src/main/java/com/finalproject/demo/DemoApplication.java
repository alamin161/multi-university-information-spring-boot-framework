package com.finalproject.demo;

import com.finalproject.demo.controller.TeacherController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

@SpringBootApplication
public class DemoApplication {

    public static void main(String[] args) {
        //new File(TeacherController.uploadDirectory).mkdir();
        SpringApplication.run(DemoApplication.class, args);
    }

}

