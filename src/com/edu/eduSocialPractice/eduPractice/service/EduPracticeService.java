package com.edu.eduSocialPractice.eduPractice.service;

import com.ToJson;
import com.edu.eduSocialPractice.eduPractice.model.EduPractice;

public interface EduPracticeService {
    ToJson getById(int id);

    ToJson getAll(int page, int limit);

    ToJson getBy(EduPractice eduPractice);

    ToJson insert(EduPractice eduPractice);

    ToJson insertSelective(EduPractice eduPractice);

    ToJson updateById(EduPractice eduPractice);

    ToJson updateSelectiveById(EduPractice eduPractice);

    ToJson deleteById(int id);

}
