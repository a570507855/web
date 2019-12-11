package com.main.book.service.impl;

import com.ToJson;
import com.main.book.dao.BookMapper;
import com.main.book.model.Book;
import com.main.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiecImpl implements BookService {
    @Autowired
    private BookMapper mapper;


    @Override
    public ToJson selectList(Integer page, Integer limit,Book book) {
        ToJson json = new ToJson("查询失败");
        try {
            List<Book> list = mapper.selectList(page,limit,book);
            json.setObj(list);
            json.setFlag(1);
            json.setMsg("查询成功");
            json.setCode("1");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson insert(Book book) {
        ToJson json = new ToJson("新增失败");
        try {
            int i = mapper.inserts(book);
            if(i>0){
                json.setFlag(1);
                json.setCode("1");
                json.setMsg("新增成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson update(Book book) {
        ToJson json = new ToJson("更新失败");
        try {
            int i = mapper.updates(book);
            if(i > 0){
                json.setFlag(1);
                json.setCode("1");
                json.setMsg("更新成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

    @Override
    public ToJson delete(String ids) {
        ToJson json = new ToJson("删除失败");
        try {
            String[] idArr = ids.split(",");
            int i = mapper.deletes(idArr);
            if(i>0){
                json.setFlag(1);
                json.setCode("1");
                json.setMsg("删除成功");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return json;
    }

}
