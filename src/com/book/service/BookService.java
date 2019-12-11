package com.book.service;

import com.ToJson;
import com.book.model.Book;

public interface BookService {

    ToJson insert(Book book);
    ToJson selectById(int id);
    ToJson selectList(Integer page,Integer limit);
}
