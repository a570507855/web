package com.controller;

import com.ToJson;
import com.pojo.City;
import com.pojo.City;
import com.serciveslmp.CityService;
import com.serciveslmp.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/jsp")
public class CityController {
    @Autowired
    private CityService cityService;


    @RequestMapping("/one")
    public String one(){return "jsp/jsp";}

    @RequestMapping("/select")
    @ResponseBody
    public ToJson select(Integer id){
        return cityService.selectList();
    }

    //查
    @RequestMapping("/get")
    @ResponseBody
    public City get(City city){
        return city;
    }


    //增
    @RequestMapping("/insert")
    @ResponseBody
    public ToJson insert(City city){
        return cityService.insertCity(city);
    }

    //改
    @RequestMapping("/update")
    @ResponseBody
    public ToJson update(City city){
        return cityService.updateCity(city);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public ToJson delete(City city){
        return cityService.deleteCity(city);
    }

}
