package com.edu.eduSocialPractice.eduPractice.service.impl;

import com.ToJson;
import com.edu.eduSocialPractice.eduPractice.dao.EduPracticeMapper;
import com.edu.eduSocialPractice.eduPractice.model.EduPractice;
import com.edu.eduSocialPractice.eduPractice.service.EduPracticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class EduPracticeServiceImpl implements EduPracticeService {

    @Autowired
    private EduPracticeMapper mapper;


    @Override
    public ToJson getById(int id) {
        ToJson json =new ToJson(1,"查询失败");
        try {
            List<Map<String, Object>> maps = mapper.selectByPrimaryKey(id);
            json.setFlag(0);
            json.setObj(maps);
            json.setMsg("查询成功");
            json.setCode("0");

        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson getAll(int page,int limit) {
        ToJson json = new ToJson(1,"查询失败");

        try{
            int firstIndex=(page-1)*limit;
            int lastIndex=page*limit;
            List<EduPractice> maps = mapper.selectList();
            json.setFlag(0);
            json.setMsg("查询成功");
            json.setCode("0");
            if(lastIndex>maps.size()){
                json.setObj(maps.subList(firstIndex,maps.size()));
            }else
            {
                json.setObj(maps.subList(firstIndex,lastIndex));
            }

            json.setTotleNum(maps.size());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson getBy(EduPractice eduPractice) {
        ToJson json = new ToJson(1,"查询失败");
        try {
            List<EduPractice> eduPractices = mapper.selectBy(eduPractice);
            json.setObj(eduPractices);
            json.setMsg("查询成功");
            json.setFlag(0);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insert(EduPractice eduPractice) {
        ToJson json = new ToJson(1,"插入失败");
        try {
            int insert = mapper.insert(eduPractice);
            if(insert>0){
                json.setMsg("插入成功");
                json.setCode("0");
                json.setFlag(0);
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insertSelective(EduPractice eduPractice) {
            ToJson json = new ToJson(1,"插入失败");
            try {
                int i = mapper.insertSelective(eduPractice);
                if(i>0){
                    json.setFlag(0);
                    json.setMsg("插入成功");
                    json.setCode("0");
                }
            }
            catch (Exception e){
                e.printStackTrace();
            }
            return json;
    }

    @Override
    public ToJson updateById(EduPractice eduPractice) {
        ToJson json = new ToJson(1,"更新失败");
        try {
            int i = mapper.updateByPrimaryKey(eduPractice);
            if(i>0){
                json.setFlag(0);
                json.setMsg("更新成功");
                json.setCode("0");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson updateSelectiveById(EduPractice eduPractice) {
        ToJson json = new ToJson(1,"更新失败");
        try {
            int i = mapper.updateByPrimaryKeySelective(eduPractice);
            if(i>0){
                json.setFlag(0);
                json.setMsg("更新成功");
                json.setCode("0");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson deleteById(int id) {
        ToJson json = new ToJson(1,"删除失败");
        try{
            int i = mapper.deleteByPrimaryKey(id);
            if(i>0){
                json.setFlag(0);
                json.setMsg("删除成功");
                json.setCode("0");
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }
}
