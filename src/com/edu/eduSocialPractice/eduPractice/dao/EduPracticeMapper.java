package com.edu.eduSocialPractice.eduPractice.dao;

import com.edu.eduSocialPractice.eduPractice.model.EduPractice;

import java.util.List;
import java.util.Map;
public interface EduPracticeMapper {
    int deleteByPrimaryKey(Integer practiceId);

    int insert(EduPractice record);

    int insertSelective(EduPractice record);


    List<Map<String,Object>> selectByPrimaryKey(Integer practiceId);

    List<EduPractice> selectList();

    List<EduPractice> selectBy(EduPractice eduPractice);

    int updateByPrimaryKeySelective(EduPractice record);

    int updateByPrimaryKey(EduPractice record);
}