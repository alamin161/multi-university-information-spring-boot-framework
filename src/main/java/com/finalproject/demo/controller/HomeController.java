package com.finalproject.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(){
        return "app.homepage";
    }

    @RequestMapping("/index")
    public String showIndex(){
        return "index";
    }

    @RequestMapping("/home")
    public String showHome(){
        return "home";
    }

    @RequestMapping("/login")
    public String showLogin(){
        return "login";
    }

    @RequestMapping(value = "/test")
    public String showTest(){
        return "test";
    }

    @RequestMapping(value = "/bd-newspaper")
    public String bdNewspaper(){
        return "showBdNewspaper";
    }

    @RequestMapping(value = "/international-newspaper")
    public String internationalNewspaper(){
        return "showIntPaper";
    }

    @RequestMapping(value = "/all-university-notice-board")
    public String allNoticeBoard(){
        return "showNoticeBoard";
    }

    @RequestMapping(value = "/all-university-admission-information")
    public String allAdmissionInfo(){
        return "showAdmissionInfo";
    }

    @RequestMapping(value = "/all-university-event-information")
    public String allEventsInfo(){
        return "showEventInfo";
    }

    @RequestMapping(value = "/all-university-convocation-information")
    public String allConvocationInfo(){
        return "showConvocationInfo";
    }

    @RequestMapping(value = "/all-job-sites")
    public String allJobSite(){
        return "showJobSite";
    }
}
