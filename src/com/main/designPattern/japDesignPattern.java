package com.main.designPattern;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("designPattern")
public class japDesignPattern {


    @RequestMapping("studyNotes")
    public String studyNotes(){
        return "main/studyNotes/designPattern/studyNotes";
    }

    @RequestMapping("designPatternMenu")
    public String designPatternMenu(){
        return "fixed/designPatternMenu";
    }

    @RequestMapping("singletonPattern")
    public String singletonPattern(){
        return "main/studyNotes/designPattern/singletonPattern";
    }
}
