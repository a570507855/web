package com.main.book.service;

import com.ToJson;
import com.main.book.model.Book;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BookService {

    ToJson selectList(Integer page,Integer limit,Book book);

    ToJson insert(Book book);

    ToJson update(Book book);

    ToJson delete(String ids);

    ToJson export(HttpServletResponse response, HttpServletRequest request);

}
