package com.main.book.controller;

import com.ToJson;
import com.main.book.model.Book;
import com.main.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("book")
public class BookController {
    @Autowired
    private BookService bookService;


    @RequestMapping("query")
    public String query(){
        return "main/book/book";
    }

    /**
     * 分页查询，条件查询
     * @param page
     * @param limit
     * @param book
     * @return
     */
    @ResponseBody
    @RequestMapping("selectList")
    public ToJson selectList(Integer page,Integer limit,Book book){
        return bookService.selectList(page,limit,book);
    }

    /**
     * 新增
     * @param book
     * @return
     */
    @ResponseBody
    @RequestMapping("insert")
    public ToJson insert(Book book){
        return bookService.insert(book);
    }

    /**
     * 更新
     * @param book
     * @return
     */
    @ResponseBody
    @RequestMapping("update")
    public ToJson update(Book book){
        return bookService.update(book);
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping("delete")
    public ToJson delete(String id){
        return bookService.delete(id);
    }

}
