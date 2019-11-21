package com.serciveslmp;


import com.ToJson;
import com.pojo.City;

import java.util.List;
import java.util.Map;

public interface CityService {
     ToJson selectList();
     ToJson insertCity(City city);
     ToJson updateCity(City city);
     ToJson deleteCity(City city);
}
