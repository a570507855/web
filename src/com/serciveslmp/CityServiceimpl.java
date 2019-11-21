package com.serciveslmp;

import com.ToJson;
import com.dao.CityMapper;
import com.dao.CityMapper;
import com.pojo.City;
import com.pojo.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CityServiceimpl implements CityService{
    @Autowired
    private CityMapper mapper;
    @Override
    public ToJson selectList() {
        ToJson josn=new ToJson(1,"error");
        try {
            List<Map<String, Object>> mapList = mapper.selectList();
            josn.setFlag(0);
            josn.setCode("0");
            josn.setObj(mapList);

        } catch (Exception e) {
            e.printStackTrace();
            josn.setCode("1");
        }
        return josn;
    }

    @Override
    public ToJson insertCity(City city) {
        ToJson josn = new ToJson(1,"error");
        try {
            int i = mapper.insertCity(city);
            if(i>0){
                josn.setFlag(0);
                josn.setMsg("success");
            }

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return josn;
    }

    @Override
    public ToJson updateCity(City city) {
        ToJson josn = new ToJson(1,"error");
        try {
            int i = mapper.updateCity(city);
            if(i>0){
                josn.setFlag(0);
                josn.setMsg("success");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return josn;
    }

    @Override
    public ToJson deleteCity(City city) {
        ToJson josn = new ToJson(1,"error");
        try {
            int i = mapper.deleteCity(city);
            if(i>0){
                josn.setFlag(0);
                josn.setMsg("success");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return josn;
    }
}
