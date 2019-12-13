package com.main.book.controller;

import com.ToJson;
import com.main.book.model.Book;
import com.main.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("book")
public class BookController {
    @Autowired
    private BookService bookService;


    @RequestMapping("query")
    public String query(HttpServletRequest request, HttpServletResponse response){
        System.out.println("**************************************");

        //获取客户端cookie
        System.out.println(request.getHeader("cookie"));
        //设置服务端cookie
        response.addCookie(new Cookie("username","disueb"));
        //设置session
        HttpSession session = request.getSession();
        session.setAttribute("username","许亦勇");
        String sessionId = session.getId();
        if(session.isNew()){
            System.out.println("该session是新创建的，ID："+sessionId);
        }/*E02414723F1879780DE401AB614EBD6E*/
        else{
            System.out.println("服务器已经存在该session，ID："+sessionId);
        }
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
