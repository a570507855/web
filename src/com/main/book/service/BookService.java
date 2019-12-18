package com.main.book.service;

import com.ToJson;
import com.main.book.model.Book;

public interface BookService {

    ToJson selectList(Integer page,Integer limit,Book book);

    ToJson insert(Book book);

    ToJson update(Book book);

    ToJson delete(String id);

}
