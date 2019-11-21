package com.dao;

import com.pojo.City;

import java.util.List;
import java.util.Map;

public interface CityMapper {
    List<Map<String,Object>> selectList();

    int insertCity(City city);

    int updateCity(City city);

    int deleteCity(City city);
}
