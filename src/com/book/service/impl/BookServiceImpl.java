package com.book.service.impl;

import com.ToJson;
import com.book.dao.BookMapper;
import com.book.model.Book;
import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    public BookMapper mapper;

    @Override
    public ToJson insert(Book book) {
        ToJson json = new ToJson(1,"插入失败");
        try {
            int i = mapper.insert(book);
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
    public ToJson selectById(int id) {
        ToJson json = new ToJson(1,"查询失败");
        try {
            Book book = mapper.selectByPrimaryKey(id);
            json.setCode("0");
            json.setObject(book);
            json.setMsg("查询成功");
            json.setFlag(0);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson selectList(Integer page , Integer limit) {
        ToJson json = new ToJson(1,"查询失败");
        try {
            List<Book> list = mapper.selectList(page*limit,limit);
            json.setObj(list);
            json.setFlag(0);
            json.setMsg("查询成功");
            json.setCode("0");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return json;
    }
}
