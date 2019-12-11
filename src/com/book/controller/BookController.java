package com.book.controller;

import com.ToJson;
import com.book.model.Book;
import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    public BookService bookService;

    @RequestMapping("one")
    public String one(){
        return "book/book";
    }

    @RequestMapping("insert")
    @ResponseBody
    public ToJson insert(Book book){
        return bookService.insert(book);
    }

    @RequestMapping("selectById")
    @ResponseBody
    public ToJson selectById(int id){
        return bookService.selectById(id);
    }

    @RequestMapping("selectList")
    @ResponseBody
    public ToJson selectList(Integer page,Integer limit){
        return bookService.selectList(page,limit);
    }
}
