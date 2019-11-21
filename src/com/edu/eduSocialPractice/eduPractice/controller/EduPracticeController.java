package com.edu.eduSocialPractice.eduPractice.controller;

import com.ToJson;
import com.edu.eduSocialPractice.eduPractice.model.EduPractice;
import com.edu.eduSocialPractice.eduPractice.service.EduPracticeService;
import com.edu.eduSocialPractice.eduPractice.service.EduPracticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/eduPractice")
public class EduPracticeController {

    @Autowired
    private EduPracticeService eduPracticeService;

    @RequestMapping("/index")
    public String index(){
        return "eduPractice/index";
    }

    @RequestMapping("/practice")
    public String practice(){return "eduPractice/practice";}



    //查询全部
    @RequestMapping("/select")
    @ResponseBody
    public ToJson getById(int id){
        return eduPracticeService.getById(id);
    }

    //分页查询
    @RequestMapping("/selectList")
    @ResponseBody
    public ToJson getAll(int page,int limit){
        return eduPracticeService.getAll(page,limit);
    }

    //条件查询
    @RequestMapping("/selectBy")
    @ResponseBody
    public ToJson selectBy(EduPractice eduPractice){
        return eduPracticeService.getBy(eduPractice);
    }

    @RequestMapping("/insert")
    @ResponseBody
    public  ToJson insert(EduPractice eduPractice){
        return eduPracticeService.insert(eduPractice);
    }

    @RequestMapping("/insertSelect")
    @ResponseBody
    public  ToJson insertSelect(EduPractice eduPractice){
        return eduPracticeService.insertSelective(eduPractice);
    }

    @RequestMapping("/update")
    @ResponseBody
    public ToJson updateById(EduPractice eduPractice){
        return eduPracticeService.updateById(eduPractice);
    }

    @RequestMapping("/updateSelect")
    @ResponseBody
    public  ToJson updateSelect(EduPractice eduPractice){
        return eduPracticeService.updateSelectiveById(eduPractice);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public  ToJson delete(int id){
        return eduPracticeService.deleteById(id);
    }

}
